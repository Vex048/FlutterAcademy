// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserCheck {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCheck);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCheck()';
}


}

/// @nodoc
class $UserCheckCopyWith<$Res>  {
$UserCheckCopyWith(UserCheck _, $Res Function(UserCheck) __);
}


/// Adds pattern-matching-related methods to [UserCheck].
extension UserCheckPatterns on UserCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Data value)?  succes,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Data() when succes != null:
return succes(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Data value)  succes,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Data():
return succes(_that);case Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Data value)?  succes,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Data() when succes != null:
return succes(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( User user)?  succes,TResult Function( Exception error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Data() when succes != null:
return succes(_that.user);case Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( User user)  succes,required TResult Function( Exception error)  error,}) {final _that = this;
switch (_that) {
case Data():
return succes(_that.user);case Error():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( User user)?  succes,TResult? Function( Exception error)?  error,}) {final _that = this;
switch (_that) {
case Data() when succes != null:
return succes(_that.user);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Data implements UserCheck {
   Data(this.user);
  

 final  User user;

/// Create a copy of UserCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserCheck.succes(user: $user)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> implements $UserCheckCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of UserCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(Data(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class Error implements UserCheck {
   Error(this.error);
  

 final  Exception error;

/// Create a copy of UserCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UserCheck.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UserCheckCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 Exception error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of UserCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Exception,
  ));
}


}


/// @nodoc
mixin _$User {

 String get username; String get password; String get email; String get phone_number; String get first_name; String? get second_name; String get last_name; String? get description; int get age; Sex get sex;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.second_name, second_name) || other.second_name == second_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.description, description) || other.description == description)&&(identical(other.age, age) || other.age == age)&&(identical(other.sex, sex) || other.sex == sex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,email,phone_number,first_name,second_name,last_name,description,age,sex);

@override
String toString() {
  return 'User(username: $username, password: $password, email: $email, phone_number: $phone_number, first_name: $first_name, second_name: $second_name, last_name: $last_name, description: $description, age: $age, sex: $sex)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String username, String password, String email, String phone_number, String first_name, String? second_name, String last_name, String? description, int age, Sex sex
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? email = null,Object? phone_number = null,Object? first_name = null,Object? second_name = freezed,Object? last_name = null,Object? description = freezed,Object? age = null,Object? sex = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone_number: null == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String,first_name: null == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String,second_name: freezed == second_name ? _self.second_name : second_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: null == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  String email,  String phone_number,  String first_name,  String? second_name,  String last_name,  String? description,  int age,  Sex sex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.username,_that.password,_that.email,_that.phone_number,_that.first_name,_that.second_name,_that.last_name,_that.description,_that.age,_that.sex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  String email,  String phone_number,  String first_name,  String? second_name,  String last_name,  String? description,  int age,  Sex sex)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.username,_that.password,_that.email,_that.phone_number,_that.first_name,_that.second_name,_that.last_name,_that.description,_that.age,_that.sex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  String email,  String phone_number,  String first_name,  String? second_name,  String last_name,  String? description,  int age,  Sex sex)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.username,_that.password,_that.email,_that.phone_number,_that.first_name,_that.second_name,_that.last_name,_that.description,_that.age,_that.sex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.username, required this.password, required this.email, required this.phone_number, required this.first_name, this.second_name, required this.last_name, this.description, required this.age, required this.sex});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String username;
@override final  String password;
@override final  String email;
@override final  String phone_number;
@override final  String first_name;
@override final  String? second_name;
@override final  String last_name;
@override final  String? description;
@override final  int age;
@override final  Sex sex;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.second_name, second_name) || other.second_name == second_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.description, description) || other.description == description)&&(identical(other.age, age) || other.age == age)&&(identical(other.sex, sex) || other.sex == sex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,email,phone_number,first_name,second_name,last_name,description,age,sex);

@override
String toString() {
  return 'User(username: $username, password: $password, email: $email, phone_number: $phone_number, first_name: $first_name, second_name: $second_name, last_name: $last_name, description: $description, age: $age, sex: $sex)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String email, String phone_number, String first_name, String? second_name, String last_name, String? description, int age, Sex sex
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? email = null,Object? phone_number = null,Object? first_name = null,Object? second_name = freezed,Object? last_name = null,Object? description = freezed,Object? age = null,Object? sex = null,}) {
  return _then(_User(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone_number: null == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String,first_name: null == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String,second_name: freezed == second_name ? _self.second_name : second_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: null == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,
  ));
}


}

// dart format on
