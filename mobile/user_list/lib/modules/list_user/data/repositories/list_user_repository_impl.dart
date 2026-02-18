import 'package:user_list/modules/list_user/data/models/list_user_model.dart';
import 'package:user_list/modules/list_user/data/repositories/abs_list_user_repository.dart';

class ListUser_ListUserRepositoryImpl
    implements AbsListUser_ListUserRepository {
  @override
  Future<List<ListUser_ListUserModel>> getUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const ListUser_ListUserModel(
        id: '1',
        name: 'Diego Antunes',
        email: 'diego@example.com',
      ),
      const ListUser_ListUserModel(
        id: '2',
        name: 'Ilia Mobile',
        email: 'mobile@ilia.digital',
      ),
    ];
  }
}
