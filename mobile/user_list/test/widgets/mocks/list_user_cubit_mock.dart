import 'package:bloc_test/bloc_test.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_state.dart';

class MockListUserCubit extends MockCubit<ListUser_ListUserState>
    implements ListUser_ListUserCubit {}
