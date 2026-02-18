import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/modules/list_user/data/repositories/abs_list_user_repository.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_state.dart';

class ListUser_ListUserCubit extends Cubit<ListUser_ListUserState> {
  ListUser_ListUserCubit(this.repository) : super(ListUser_ListUserInitial());
  final AbsListUser_ListUserRepository repository;

  Future<void> fetchUsers() async {
    emit(ListUser_ListUserLoading());
    try {
      final users = await repository.getUsers();

      if (users.isEmpty) {
        emit(ListUser_ListUserEmpty());
        return;
      }

      emit(ListUser_ListUserSuccess(users));
    } catch (e) {
      emit(ListUser_ListUserError('error'));
    }
  }
}
