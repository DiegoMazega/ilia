import 'package:flutter/foundation.dart';
import 'package:user_list/modules/create_user/data/models/create_user_model.dart';
import 'package:user_list/modules/create_user/domain/repositories/abs_create_user_repository.dart';

class CreateUser_CreateUserRepositoryImpl
    implements CreateUser_AbsCreateUserRepository {
  @override
  Future<void> createUser(CreateUser_CreateUserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('User created: ${user.toJson()}');
  }
}
