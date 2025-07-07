

import 'dart:convert';
import 'dart:io';
import "user.dart";
void main(){
  // czytanie z pliku
  const filePath = 'day2-3/user.json';
  final jsonStr = File(filePath).readAsStringSync();
  print("JsonStr: ${jsonStr}");

  // Decoding z Json String do Mapy
  final userMap = jsonDecode(jsonStr) as Map<String,dynamic>;
  print("Po jsonDecode, userMap: ${userMap}");
  print("User name: ${userMap['first_name']} ${userMap['second_name'] ?? ''} ${userMap['last_name']} ".trim());


  // Tworzenie użytkownika z mapy 
  final User user = User.fromJson(userMap);
  print("User with class: ${user.username}, ${user.email}");

// Tu będzie zawsze false, bo używamy == bo są rożnymi obiektami nawet jeśli mają taką samą rzecz w środku. Jak w Javie
  print(user.toJson() == userMap);
  // Tu powiino być true, bo porownujemy stringi
  print(user.toJson().toString() == userMap.toString());

  //Jako JsonObject
  // Dlaczego Stringi w mapie nie posiadają ""?
  print("Json Object(Mapa) User.toJson(): ${user.toJson()}");

  // Jako JsonString
  var jsonStringUser = user.toJsonString();
  print("Jako json String: ${jsonStringUser}");
  // Do pliku result.json
  const outputPath  = 'day2-3/result.json';
  File(outputPath).writeAsStringSync(jsonStringUser);

  //Sprawdzenie czy równe
  print(jsonStringUser == jsonStr);
  // Wychodzi false? Problem indentacji i spacji w środku? Bardzo Możliwe


}