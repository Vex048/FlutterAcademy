import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/widgets/HomePage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// Main, który tworzyc ProviderScope, który przechowuje stany Providerów (chyba)
void main() {
  runApp(const ProviderScope(
    child: MyApp() // Init apki
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      // Budowa głównego widoku HomePage
      home: const MyHomePage(title: "Home Highlight App"),
    );
  }
}



