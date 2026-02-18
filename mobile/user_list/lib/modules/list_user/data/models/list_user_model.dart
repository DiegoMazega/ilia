import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_user_model.freezed.dart';
part 'list_user_model.g.dart';

@freezed
abstract class ListUser_ListUserModel with _$ListUser_ListUserModel {
  const factory ListUser_ListUserModel({
    required dynamic id,
    required String name,
    required String email,
  }) = _ListUser_ListUserModel;

  factory ListUser_ListUserModel.fromJson(Map<String, dynamic> json) =>
      _$ListUser_ListUserModelFromJson(json);
}
