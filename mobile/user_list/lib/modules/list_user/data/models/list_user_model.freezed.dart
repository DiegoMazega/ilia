// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListUser_ListUserModel {

 dynamic get id; String get name; String get email;
/// Create a copy of ListUser_ListUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListUser_ListUserModelCopyWith<ListUser_ListUserModel> get copyWith => _$ListUser_ListUserModelCopyWithImpl<ListUser_ListUserModel>(this as ListUser_ListUserModel, _$identity);

  /// Serializes this ListUser_ListUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListUser_ListUserModel&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,email);

@override
String toString() {
  return 'ListUser_ListUserModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $ListUser_ListUserModelCopyWith<$Res>  {
  factory $ListUser_ListUserModelCopyWith(ListUser_ListUserModel value, $Res Function(ListUser_ListUserModel) _then) = _$ListUser_ListUserModelCopyWithImpl;
@useResult
$Res call({
 dynamic id, String name, String email
});




}
/// @nodoc
class _$ListUser_ListUserModelCopyWithImpl<$Res>
    implements $ListUser_ListUserModelCopyWith<$Res> {
  _$ListUser_ListUserModelCopyWithImpl(this._self, this._then);

  final ListUser_ListUserModel _self;
  final $Res Function(ListUser_ListUserModel) _then;

/// Create a copy of ListUser_ListUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListUser_ListUserModel].
extension ListUser_ListUserModelPatterns on ListUser_ListUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListUser_ListUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListUser_ListUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListUser_ListUserModel value)  $default,){
final _that = this;
switch (_that) {
case _ListUser_ListUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListUser_ListUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListUser_ListUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListUser_ListUserModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _ListUser_ListUserModel():
return $default(_that.id,_that.name,_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _ListUser_ListUserModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListUser_ListUserModel implements ListUser_ListUserModel {
  const _ListUser_ListUserModel({required this.id, required this.name, required this.email});
  factory _ListUser_ListUserModel.fromJson(Map<String, dynamic> json) => _$ListUser_ListUserModelFromJson(json);

@override final  dynamic id;
@override final  String name;
@override final  String email;

/// Create a copy of ListUser_ListUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListUser_ListUserModelCopyWith<_ListUser_ListUserModel> get copyWith => __$ListUser_ListUserModelCopyWithImpl<_ListUser_ListUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListUser_ListUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListUser_ListUserModel&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,email);

@override
String toString() {
  return 'ListUser_ListUserModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ListUser_ListUserModelCopyWith<$Res> implements $ListUser_ListUserModelCopyWith<$Res> {
  factory _$ListUser_ListUserModelCopyWith(_ListUser_ListUserModel value, $Res Function(_ListUser_ListUserModel) _then) = __$ListUser_ListUserModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String name, String email
});




}
/// @nodoc
class __$ListUser_ListUserModelCopyWithImpl<$Res>
    implements _$ListUser_ListUserModelCopyWith<$Res> {
  __$ListUser_ListUserModelCopyWithImpl(this._self, this._then);

  final _ListUser_ListUserModel _self;
  final $Res Function(_ListUser_ListUserModel) _then;

/// Create a copy of ListUser_ListUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? email = null,}) {
  return _then(_ListUser_ListUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
