// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  username: json['username'] as String,
  password: json['password'] as String,
  first_name: json['first_name'] as String,
  second_name: json['second_name'] as String?,
  last_name: json['last_name'] as String,
  email: json['email'] as String,
  phone_number: json['phone_number'] as String,
  age: (json['age'] as num).toInt(),
  description: json['description'] as String?,
  sex: $enumDecode(_$SexEnumMap, json['sex']),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'first_name': instance.first_name,
  'second_name': instance.second_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'password': instance.password,
  'username': instance.username,
  'phone_number': instance.phone_number,
  'age': instance.age,
  'description': instance.description,
  'sex': _$SexEnumMap[instance.sex]!,
};

const _$SexEnumMap = {Sex.M: 'M', Sex.K: 'K', Sex.NB: 'NB'};
