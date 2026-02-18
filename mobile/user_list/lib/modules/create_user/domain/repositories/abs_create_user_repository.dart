import 'package:user_list/modules/create_user/data/models/create_user_model.dart';

abstract class CreateUser_AbsCreateUserRepository {
  Future<void> createUser(CreateUser_CreateUserModel user);
}
