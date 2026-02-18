import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_list/modules/list_user/data/models/list_user_model.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_state.dart';
import 'mocks/list_user_repository_mock.dart';

void main() {
  late MockListUserRepository mockRepository;
  late ListUser_ListUserCubit cubit;

  final mockUsers = const [
    ListUser_ListUserModel(id: '1', name: 'User 1', email: 'user1@test.com'),
    ListUser_ListUserModel(id: '2', name: 'User 2', email: 'user2@test.com'),
  ];

  setUp(() {
    mockRepository = MockListUserRepository();
    cubit = ListUser_ListUserCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('ListUser_ListUserCubit', () {
    test('initial state should be ListUser_ListUserInitial', () {
      expect(cubit.state, isA<ListUser_ListUserInitial>());
    });

    blocTest<ListUser_ListUserCubit, ListUser_ListUserState>(
      'emits [Loading, Success] when fetchUsers is successful and has data',
      build: () {
        when(
          () => mockRepository.getUsers(),
        ).thenAnswer((_) async => mockUsers);
        return cubit;
      },
      act: (cubit) => cubit.fetchUsers(),
      expect: () => [
        isA<ListUser_ListUserLoading>(),
        isA<ListUser_ListUserSuccess>().having(
          (s) => s.users,
          'users',
          mockUsers,
        ),
      ],
    );

    blocTest<ListUser_ListUserCubit, ListUser_ListUserState>(
      'emits [Loading, Empty] when fetchUsers is successful but has no data',
      build: () {
        when(() => mockRepository.getUsers()).thenAnswer((_) async => []);
        return cubit;
      },
      act: (cubit) => cubit.fetchUsers(),
      expect: () => [
        isA<ListUser_ListUserLoading>(),
        isA<ListUser_ListUserEmpty>(),
      ],
    );

    blocTest<ListUser_ListUserCubit, ListUser_ListUserState>(
      'emits [Loading, Error] when fetchUsers fails',
      build: () {
        when(
          () => mockRepository.getUsers(),
        ).thenThrow(Exception('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.fetchUsers(),
      expect: () => [
        isA<ListUser_ListUserLoading>(),
        isA<ListUser_ListUserError>(),
      ],
    );
  });
}
