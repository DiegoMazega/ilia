import 'package:user_list/modules/list_user/data/models/list_user_model.dart';

abstract class ListUser_ListUserState {}

class ListUser_ListUserInitial extends ListUser_ListUserState {}

class ListUser_ListUserLoading extends ListUser_ListUserState {}

class ListUser_ListUserEmpty extends ListUser_ListUserState {}

class ListUser_ListUserSuccess extends ListUser_ListUserState {
  ListUser_ListUserSuccess(this.users);
  final List<ListUser_ListUserModel> users;
}

class ListUser_ListUserError extends ListUser_ListUserState {
  ListUser_ListUserError(this.message);
  final String message;
}
