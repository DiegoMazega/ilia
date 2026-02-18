import 'package:bloc_test/bloc_test.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_state.dart';

class MockCreateUserCubit extends MockCubit<CreateUser_CreateUserState>
    implements CreateUser_CreateUserCubit {}
