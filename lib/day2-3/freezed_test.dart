import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_test.freezed.dart';
part 'freezed_test.g.dart';

enum Sex { M, K, NB }

@freezed
abstract class User with _$User {
  const factory User({
    required String username,
    required String password,
    required String email,
    required String phone_number,
    required String first_name,
    String? second_name,
    required String last_name,
    String? description,
    required int age,
    required Sex sex
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

}

void main(){
  const filePath = 'lib/day2-3/user.json';
  final jsonStr = File(filePath).readAsStringSync();
  Map<String,dynamic> jsonObj = jsonDecode(jsonStr);
  var user = User.fromJson(jsonObj);
  var deserializable = user.toJson();
  print(deserializable);
  print(jsonEncode(deserializable));
  var user2 = user.copyWith(age: user.age+1);
  print(user2.age);
}