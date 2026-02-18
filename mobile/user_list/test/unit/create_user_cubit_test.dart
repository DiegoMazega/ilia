import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_list/modules/create_user/domain/exceptions/create_user_exception.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_state.dart';
import 'mocks/create_user_repository_mock.dart';

void main() {
  late MockCreateUserRepository mockRepository;
  late CreateUser_CreateUserCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeCreateUserModel());
  });

  setUp(() {
    mockRepository = MockCreateUserRepository();
    cubit = CreateUser_CreateUserCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('CreateUser_CreateUserCubit', () {
    test('initial state should be CreateUser_CreateUserInitial', () {
      expect(cubit.state, isA<CreateUser_CreateUserInitial>());
    });

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Loading, Success] when createUser succeeds',
      build: () {
        when(() => mockRepository.createUser(any())).thenAnswer((_) async {});
        return cubit;
      },
      act: (cubit) => cubit.createUser('Diego Antunes', 'diego@example.com'),
      expect: () => [
        isA<CreateUser_CreateUserLoading>(),
        isA<CreateUser_CreateUserSuccess>(),
      ],
      verify: (_) {
        verify(() => mockRepository.createUser(any())).called(1);
      },
    );

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Loading, Error([emailAlreadyExists])] when repository throws CreateUserException',
      build: () {
        when(() => mockRepository.createUser(any())).thenThrow(
          CreateUser_CreateUserException('Ilia.user.email_already_exists'),
        );
        return cubit;
      },
      act: (cubit) => cubit.createUser('Diego Antunes', 'diego@example.com'),
      expect: () => [
        isA<CreateUser_CreateUserLoading>(),
        isA<CreateUser_CreateUserError>().having((e) => e.errors, 'errors', [
          CreateUser_CreateUserErrorType.emailAlreadyExists,
        ]),
      ],
    );

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Error([invalidName])] when name is invalid',
      build: () => cubit,
      act: (cubit) => cubit.validateUser('Diego', 'diego@example.com'),
      expect: () => [
        isA<CreateUser_CreateUserInitial>(),
        isA<CreateUser_CreateUserError>().having((e) => e.errors, 'errors', [
          CreateUser_CreateUserErrorType.invalidName,
        ]),
      ],
    );

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Error([invalidEmail])] when email is invalid',
      build: () => cubit,
      act: (cubit) => cubit.validateUser('Diego Antunes', 'invalid-email'),
      expect: () => [
        isA<CreateUser_CreateUserInitial>(),
        isA<CreateUser_CreateUserError>().having((e) => e.errors, 'errors', [
          CreateUser_CreateUserErrorType.invalidEmail,
        ]),
      ],
    );

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Error([invalidName, invalidEmail])] when both fields are invalid',
      build: () => cubit,
      act: (cubit) => cubit.validateUser('Diego', 'invalid-email'),
      expect: () => [
        isA<CreateUser_CreateUserInitial>(),
        isA<CreateUser_CreateUserError>().having(
          (e) => e.errors,
          'errors',
          containsAll([
            CreateUser_CreateUserErrorType.invalidName,
            CreateUser_CreateUserErrorType.invalidEmail,
          ]),
        ),
      ],
    );

    blocTest<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
      'emits [Loading, Error([unknown])] when repository throws unknown exception',
      build: () {
        when(
          () => mockRepository.createUser(any()),
        ).thenThrow(Exception('Failed to create user'));
        return cubit;
      },
      act: (cubit) => cubit.createUser('Diego Antunes', 'diego@example.com'),
      expect: () => [
        isA<CreateUser_CreateUserLoading>(),
        isA<CreateUser_CreateUserError>().having((e) => e.errors, 'errors', [
          CreateUser_CreateUserErrorType.unknown,
        ]),
      ],
    );
  });
}
