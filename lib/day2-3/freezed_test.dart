import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_test.freezed.dart';
part 'freezed_test.g.dart';

enum Sex { M, K, NB }



// Implementowanie własnych Exceptions  
class UserTooYoungException implements Exception {
  final String message;
  UserTooYoungException.Custom(this.message);
  UserTooYoungException({this.message = "User have to be more than 13 years old"});
  @override
  String toString() => 'UserTooYoungException: $message';
}
class UserWrongEmailException implements Exception {
  final String message;

  UserWrongEmailException({this.message = "Email doesnt have @ char"});
  @override
  String toString() => 'UserWrongEmailException: $message';
}
class UserWrongSexException implements Exception {
  final String message;

  UserWrongSexException({this.message = "Wrong sex"});
  @override
  String toString() => 'UserWrongSexException: $message';
}

class UserWrongPhoneNumberException implements Exception {
  final String message;

  UserWrongPhoneNumberException({this.message = "Phone number has wrong amount of numbers"});
  @override
  String toString() => 'UserWrongPhoneNumberException: $message';
}


//Union, który zwraca bład jako wyjątek, a sukces jako obiekt user 
@freezed
sealed class UserCheck with _$UserCheck {
  factory UserCheck.succes(User user) = Data;
  factory UserCheck.error(Exception error) = Error;
}
// Funkcja walidująca dane 
UserCheck preproccessUser(Map<String,Object?> json){
  try {
    final user = User.fromJson(json);
    if (user.age < 13){
      return UserCheck.error(UserTooYoungException());
    }
    else if (!user.email.contains("@")){
      return UserCheck.error(UserWrongEmailException());
    }
    else if (user.phone_number.length > 15 || user.phone_number.length < 9){
      return UserCheck.error(UserWrongPhoneNumberException());
    }
    else if (!Sex.values.contains(user.sex)){
      return UserCheck.error(UserWrongSexException());
    }
    else{
      return UserCheck.succes(user);
    }
    
      
  } catch (e) {
    return UserCheck.error(UserTooYoungException.Custom('Something is wrong'));
  }
}


// Klasa użytkownika
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
    required Sex sex,
    //[@Default("Hi") String char] Tutaj przykład Defaultu
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

  final result = preproccessUser(jsonObj);

  result.when(
    succes: (user) {
      print('User loadedd: ${user.toJson()}');
      // copyWith tworzy kopię obiektu (możemy stworzyć kopię obiektu z innymi wartościami atrybutów )
      var user2 = user.copyWith(age: user.age + 1);
      print('User2 age: ${user2.age}');
    },
    error: (error) => print('Error: $error'),
  );

  jsonObj['age'] = 12;
  final result2 = preproccessUser(jsonObj);
  result2.when(
  succes: (user) {print(user.toJson());}, 
  error: (error) {print('Validation failed: $error');});


}