import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';

abstract class CreateUser_CreateUserState {}

class CreateUser_CreateUserInitial extends CreateUser_CreateUserState {}

class CreateUser_CreateUserLoading extends CreateUser_CreateUserState {}

class CreateUser_CreateUserSuccess extends CreateUser_CreateUserState {}

class CreateUser_CreateUserError extends CreateUser_CreateUserState {
  CreateUser_CreateUserError(this.errors);
  final List<CreateUser_CreateUserErrorType> errors;
}
