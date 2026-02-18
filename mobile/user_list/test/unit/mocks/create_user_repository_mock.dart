import 'package:mocktail/mocktail.dart';
import 'package:user_list/modules/create_user/data/models/create_user_model.dart';
import 'package:user_list/modules/create_user/domain/repositories/abs_create_user_repository.dart';

class MockCreateUserRepository extends Mock
    implements CreateUser_AbsCreateUserRepository {}

class FakeCreateUserModel extends Fake implements CreateUser_CreateUserModel {}
