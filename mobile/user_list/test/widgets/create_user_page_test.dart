import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_list/l10n/app_localizations.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_state.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_page.dart';
import 'mocks/create_user_cubit_mock.dart';

void main() {
  late MockCreateUserCubit mockCubit;
  late StreamController<CreateUser_CreateUserState> stateController;

  setUp(() {
    mockCubit = MockCreateUserCubit();
    stateController = StreamController<CreateUser_CreateUserState>.broadcast();
    when(() => mockCubit.stream).thenAnswer((_) => stateController.stream);
  });

  tearDown(() {
    stateController.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pt')],
      home: BlocProvider<CreateUser_CreateUserCubit>.value(
        value: mockCubit,
        child: const CreateUser_CreateUserPage(),
      ),
    );
  }

  testWidgets('renders all form fields and save button', (tester) async {
    when(() => mockCubit.state).thenReturn(CreateUser_CreateUserInitial());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('shows name error when name validator fails', (tester) async {
    when(() => mockCubit.state).thenReturn(CreateUser_CreateUserInitial());

    await tester.pumpWidget(createWidgetUnderTest());

    when(() => mockCubit.state).thenReturn(
      CreateUser_CreateUserError([CreateUser_CreateUserErrorType.invalidName]),
    );
    stateController.add(
      CreateUser_CreateUserError([CreateUser_CreateUserErrorType.invalidName]),
    );

    await tester.pump();

    expect(find.textContaining('Please enter at least'), findsOneWidget);
  });

  testWidgets('shows email error when email validator fails', (tester) async {
    when(() => mockCubit.state).thenReturn(CreateUser_CreateUserInitial());
    await tester.pumpWidget(createWidgetUnderTest());

    when(() => mockCubit.state).thenReturn(
      CreateUser_CreateUserError([CreateUser_CreateUserErrorType.invalidEmail]),
    );
    stateController.add(
      CreateUser_CreateUserError([CreateUser_CreateUserErrorType.invalidEmail]),
    );

    await tester.pump();

    expect(find.textContaining('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('shows loading indicator when state is loading', (tester) async {
    when(() => mockCubit.state).thenReturn(CreateUser_CreateUserLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('calls createUser when button is pressed', (tester) async {
    when(() => mockCubit.state).thenReturn(CreateUser_CreateUserInitial());
    when(() => mockCubit.validateUser(any(), any())).thenReturn(true);
    when(() => mockCubit.createUser(any(), any())).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.enterText(find.byType(TextField).first, 'Diego Antunes');
    await tester.enterText(find.byType(TextField).last, 'diego@test.com');
    await tester.tap(find.byType(ElevatedButton));

    verify(
      () => mockCubit.validateUser('Diego Antunes', 'diego@test.com'),
    ).called(1);
    verify(
      () => mockCubit.createUser('Diego Antunes', 'diego@test.com'),
    ).called(1);
  });
}
