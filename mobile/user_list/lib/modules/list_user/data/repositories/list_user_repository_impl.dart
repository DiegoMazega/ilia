import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_list/modules/list_user/data/models/list_user_model.dart';
import 'package:user_list/modules/list_user/data/repositories/abs_list_user_repository.dart';
import 'package:user_list/modules/shared/config/ilia_base_endpoint.dart';

class ListUser_ListUserRepositoryImpl
    implements AbsListUser_ListUserRepository {
  @override
  Future<List<ListUser_ListUserModel>> getUsers() async {
    final uri = Uri.parse('$iliaBaseEndpoint/v1/users');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch users: ${response.body}');
    }

    final List<dynamic> data = jsonDecode(response.body);
    return data
        .map(
          (json) =>
              ListUser_ListUserModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
