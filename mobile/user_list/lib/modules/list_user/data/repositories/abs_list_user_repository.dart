import 'package:user_list/modules/list_user/data/models/list_user_model.dart';

abstract class AbsListUser_ListUserRepository {
  Future<List<ListUser_ListUserModel>> getUsers();
}
