import 'package:equatable/equatable.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';

abstract class CreateUser_CreateUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUser_CreateUserInitial extends CreateUser_CreateUserState {}

class CreateUser_CreateUserLoading extends CreateUser_CreateUserState {}

class CreateUser_CreateUserSuccess extends CreateUser_CreateUserState {}

class CreateUser_CreateUserError extends CreateUser_CreateUserState {
  CreateUser_CreateUserError(this.errors);
  final List<CreateUser_CreateUserErrorType> errors;

  @override
  List<Object?> get props => [errors];
}
