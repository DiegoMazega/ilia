import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.freezed.dart';
part 'create_user_model.g.dart';

@freezed
abstract class CreateUser_CreateUserModel with _$CreateUser_CreateUserModel {
  const factory CreateUser_CreateUserModel({
    required String name,
    required String email,
  }) = _CreateUser_CreateUserModel;

  factory CreateUser_CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUser_CreateUserModelFromJson(json);
}
