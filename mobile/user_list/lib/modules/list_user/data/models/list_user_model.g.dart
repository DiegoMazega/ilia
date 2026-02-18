// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListUser_ListUserModel _$ListUser_ListUserModelFromJson(
  Map<String, dynamic> json,
) => _ListUser_ListUserModel(
  id: json['id'],
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$ListUser_ListUserModelToJson(
  _ListUser_ListUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
};
