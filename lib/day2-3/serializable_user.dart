import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'dart:io';

part 'serializable_user.g.dart';

enum Sex { M, K, NB }


@JsonSerializable()
class User{
  final String first_name;
  final String? second_name; // Moze byc null bo nie kazda ma drugie imie
  final String last_name;
  final String email;
  final String password;
  final String username;
  final String phone_number;
  final int age;
  final String? description; // Moze byc null, bo nie kazdy chce miec opis
  final Sex sex;

  User({
    required this.username,
    required this.password,
    required this.first_name,
    this.second_name,
    required this.last_name,
    required this.email,
    required this.phone_number,
    required this.age,
    this.description,
    required this.sex,
  }){
    // Sprawdzanie constraintow, dla zwyklego konstruktora
    ageCheck(age);
    emailCheck(email);
    phoneNumberCheck(phone_number);
    correctSexCheck(sex);
  }

  // Constraints
  void ageCheck(int age){
    if (age < 13){
      throw ArgumentError('User have to be older than 13 years old');
    }
  }
  void emailCheck(String email){
    if (!email.contains("@")){
      throw ArgumentError("Email doesnt have @ char in it");
    }
  }
  void phoneNumberCheck(String phone_number){ 
    if (phone_number.length > 15 || phone_number.length < 9){
      throw ArgumentError("Invalid length of phone number");
    }
  }
  void correctSexCheck(Sex sex){
    if (!Sex.values.contains(sex)){
      throw ArgumentError('Invalid sex value');
    }
  }
  // Zmiana z factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json), żeby użyć Checków
  factory User.fromJson(Map<String, dynamic> json) {
    var user = _$UserFromJson(json);
    user.ageCheck(user.age);
    user.emailCheck(user.email);
    user.phoneNumberCheck(user.phone_number);
    user.correctSexCheck(user.sex);
    return user;
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

    String toJsonString(){
        final encoder = JsonEncoder.withIndent('  ');
        String jsonStringUser = encoder.convert(this.toJson());
        return jsonStringUser;
    }
}
void main() {
  const filePath = 'lib/day2-3/user.json';
  final jsonStr = File(filePath).readAsStringSync();
  Map<String,dynamic> jsonObj = jsonDecode(jsonStr);
  var user = User.fromJson(jsonObj);
  print(user.toJson());
  var jsonStringUser =  user.toJsonString();
  print(jsonStringUser);
  const outputPath  = 'lib/day2-3/result2.json';
  File(outputPath).writeAsStringSync(jsonStringUser);

}