// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateUser_CreateUserModel {

 String get name; String get email;
/// Create a copy of CreateUser_CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUser_CreateUserModelCopyWith<CreateUser_CreateUserModel> get copyWith => _$CreateUser_CreateUserModelCopyWithImpl<CreateUser_CreateUserModel>(this as CreateUser_CreateUserModel, _$identity);

  /// Serializes this CreateUser_CreateUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUser_CreateUserModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'CreateUser_CreateUserModel(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $CreateUser_CreateUserModelCopyWith<$Res>  {
  factory $CreateUser_CreateUserModelCopyWith(CreateUser_CreateUserModel value, $Res Function(CreateUser_CreateUserModel) _then) = _$CreateUser_CreateUserModelCopyWithImpl;
@useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class _$CreateUser_CreateUserModelCopyWithImpl<$Res>
    implements $CreateUser_CreateUserModelCopyWith<$Res> {
  _$CreateUser_CreateUserModelCopyWithImpl(this._self, this._then);

  final CreateUser_CreateUserModel _self;
  final $Res Function(CreateUser_CreateUserModel) _then;

/// Create a copy of CreateUser_CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUser_CreateUserModel].
extension CreateUser_CreateUserModelPatterns on CreateUser_CreateUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUser_CreateUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUser_CreateUserModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUser_CreateUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel() when $default != null:
return $default(_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel():
return $default(_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _CreateUser_CreateUserModel() when $default != null:
return $default(_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateUser_CreateUserModel implements CreateUser_CreateUserModel {
  const _CreateUser_CreateUserModel({required this.name, required this.email});
  factory _CreateUser_CreateUserModel.fromJson(Map<String, dynamic> json) => _$CreateUser_CreateUserModelFromJson(json);

@override final  String name;
@override final  String email;

/// Create a copy of CreateUser_CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUser_CreateUserModelCopyWith<_CreateUser_CreateUserModel> get copyWith => __$CreateUser_CreateUserModelCopyWithImpl<_CreateUser_CreateUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateUser_CreateUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUser_CreateUserModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'CreateUser_CreateUserModel(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$CreateUser_CreateUserModelCopyWith<$Res> implements $CreateUser_CreateUserModelCopyWith<$Res> {
  factory _$CreateUser_CreateUserModelCopyWith(_CreateUser_CreateUserModel value, $Res Function(_CreateUser_CreateUserModel) _then) = __$CreateUser_CreateUserModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class __$CreateUser_CreateUserModelCopyWithImpl<$Res>
    implements _$CreateUser_CreateUserModelCopyWith<$Res> {
  __$CreateUser_CreateUserModelCopyWithImpl(this._self, this._then);

  final _CreateUser_CreateUserModel _self;
  final $Res Function(_CreateUser_CreateUserModel) _then;

/// Create a copy of CreateUser_CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(_CreateUser_CreateUserModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
