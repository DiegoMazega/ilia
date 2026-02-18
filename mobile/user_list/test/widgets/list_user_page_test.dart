import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_list/l10n/app_localizations.dart';
import 'package:user_list/modules/list_user/data/models/list_user_model.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_state.dart';
import 'package:user_list/modules/list_user/presentation/pages/list_user_page.dart';
import 'mocks/list_user_cubit_mock.dart';

void main() {
  late MockListUserCubit mockCubit;

  final mockUsers = const [
    ListUser_ListUserModel(
      id: '1',
      name: 'Diego Antunes',
      email: 'diego@test.com',
    ),
  ];

  setUp(() {
    mockCubit = MockListUserCubit();
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
      home: BlocProvider<ListUser_ListUserCubit>.value(
        value: mockCubit,
        child: const ListUser_ListUserPage(),
      ),
    );
  }

  testWidgets('renders ListUser_LoadingBody when state is Loading', (
    tester,
  ) async {
    when(() => mockCubit.state).thenReturn(ListUser_ListUserLoading());
    when(() => mockCubit.fetchUsers()).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders ListUser_SuccessBody when state is Success', (
    tester,
  ) async {
    when(() => mockCubit.state).thenReturn(ListUser_ListUserSuccess(mockUsers));
    when(() => mockCubit.fetchUsers()).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Diego Antunes'), findsOneWidget);
    expect(find.text('diego@test.com'), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
  });

  testWidgets('renders ListUser_EmptyBody when state is Empty', (tester) async {
    when(() => mockCubit.state).thenReturn(ListUser_ListUserEmpty());
    when(() => mockCubit.fetchUsers()).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.textContaining('No data'), findsOneWidget);
  });

  testWidgets('renders ListUser_ErrorBody when state is Error', (tester) async {
    when(() => mockCubit.state).thenReturn(ListUser_ListUserError('error'));
    when(() => mockCubit.fetchUsers()).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.textContaining('error'), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
}
