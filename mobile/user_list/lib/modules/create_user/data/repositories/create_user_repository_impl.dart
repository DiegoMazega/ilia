import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_list/modules/create_user/data/models/create_user_model.dart';
import 'package:user_list/modules/create_user/domain/repositories/abs_create_user_repository.dart';
import 'package:user_list/modules/create_user/domain/exceptions/create_user_exception.dart';
import 'package:user_list/modules/shared/config/ilia_base_endpoint.dart';

class CreateUser_CreateUserRepositoryImpl
    implements CreateUser_AbsCreateUserRepository {
  @override
  Future<void> createUser(CreateUser_CreateUserModel user) async {
    final uri = Uri.parse('$iliaBaseEndpoint/v1/create-user');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) return;

    final body = jsonDecode(response.body);
    if (body is Map && body.containsKey('error')) {
      final errorKey = body['error'];
      throw CreateUser_CreateUserException.fromKey(errorKey);
    }

    throw Exception('Failed to create user: ${response.statusCode}');
  }
}
