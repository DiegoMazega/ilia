import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/modules/create_user/data/models/create_user_model.dart';
import 'package:user_list/modules/create_user/domain/exceptions/create_user_exception.dart';
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
    emit(CreateUser_CreateUserInitial());
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
    } on CreateUser_CreateUserException catch (e) {
      final errorType = _mapError(e.key);
      emit(CreateUser_CreateUserError([errorType]));
    } catch (e) {
      emit(
        CreateUser_CreateUserError(const [
          CreateUser_CreateUserErrorType.unknown,
        ]),
      );
    }
  }

  CreateUser_CreateUserErrorType _mapError(String key) {
    switch (key) {
      case 'Ilia.user.email_already_exists':
        return CreateUser_CreateUserErrorType.emailAlreadyExists;
      case 'Ilia.user.invalid_name_format':
        return CreateUser_CreateUserErrorType.invalidNameFormat;
      case 'Ilia.user.invalid_email_format':
        return CreateUser_CreateUserErrorType.invalidEmailFormat;
      case 'Ilia.request.invalid_payload':
        return CreateUser_CreateUserErrorType.invalidPayload;
      case 'Ilia.request.rate_limit_exceeded':
        return CreateUser_CreateUserErrorType.rateLimit;
      case 'Ilia.server.internal_error':
        return CreateUser_CreateUserErrorType.serverError;
      default:
        return CreateUser_CreateUserErrorType.unknown;
    }
  }
}
