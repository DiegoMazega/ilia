import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/modules/create_user/data/models/create_user_model.dart';
import 'package:user_list/modules/create_user/domain/repositories/abs_create_user_repository.dart';
import 'package:user_list/modules/create_user/domain/validators/create_user_email_validator.dart';
import 'package:user_list/modules/create_user/domain/validators/create_user_name_validator.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_state.dart';

class CreateUser_CreateUserCubit extends Cubit<CreateUser_CreateUserState> {
  CreateUser_CreateUserCubit(this.repository)
    : super(CreateUser_CreateUserInitial());
  final CreateUser_AbsCreateUserRepository repository;

  bool validateUser(String name, String email) {
    final errors = <CreateUser_CreateUserErrorType>[];

    if (!createUser_NameValidator(name)) {
      errors.add(CreateUser_CreateUserErrorType.invalidName);
    }

    if (!createUser_EmailValidator(email)) {
      errors.add(CreateUser_CreateUserErrorType.invalidEmail);
    }

    if (errors.isNotEmpty) {
      emit(CreateUser_CreateUserError(errors));
      return false;
    }

    return true;
  }

  Future<void> createUser(String name, String email) async {
    emit(CreateUser_CreateUserLoading());
    try {
      await repository.createUser(
        CreateUser_CreateUserModel(name: name, email: email),
      );
      emit(CreateUser_CreateUserSuccess());
    } catch (e) {
      emit(
        CreateUser_CreateUserError([CreateUser_CreateUserErrorType.unknown]),
      );
    }
  }
}
