import 'dart:convert';

// Enum dla płci
enum Sex { M, K, NB }

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

  User.fromJson(Map<String,dynamic> json)
    : first_name = json['first_name'] as String,
    second_name = json['second_name'] is String ? json['second_name'] : null ,
    last_name = json['last_name'] as String,
    email = json['email'] as String,
    password = json['password'] as String,
    username = json['username'] as String,
    phone_number = json['phone_number'] as String,
    age = json['age'] as int,
    description = json['description'] is String ? json['description'] : null,
    sex = Sex.values.firstWhere((s) => s.toString().split(".").last == json['sex'],
    orElse: () => throw ArgumentError('Invalid sex value')) { // Jeżeli firstWhere nie znalazł wartośći z json['sex'] to wyrzucamy ArgumentError
      // Sprawdzanie constraintow, dla zwyklego konstruktora
    ageCheck(age);
    emailCheck(email);
    phoneNumberCheck(phone_number);
    }


  // User.toJSON should produce the exact same string as the one imported from the file (fileString == user.toJSON() should be true).
  // Ale jak toJson(), będzie zwracało String zamiast Mapy to chyba tak trochę średnio? Tuttaj nie wiem czy nie lepiej zwrócić właśnie Mape i potem najwyżej użyć JsonEncode - żeby zwrócić Json String
    Map<String,dynamic> toJson(){
      return({
      "username": this.username,
      "password":this.password,
      "first_name":this.first_name,
      "second_name":this.second_name,
      "last_name":this.last_name,
      "email":this.email,
      "phone_number":this.phone_number,
      "age":this.age,
      "description":this.description,
      "sex":this.sex.name});
    }

  // Zwrócenie Json Stringa a nie Json Object'u
    String toJsonString(){
        final encoder = JsonEncoder.withIndent('  ');
        String jsonStringUser = encoder.convert(this.toJson());
        return jsonStringUser;
    }

}