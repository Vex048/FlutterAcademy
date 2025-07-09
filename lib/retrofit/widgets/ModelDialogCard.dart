import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/api/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';


// Klasa której zadaniem jest pokazanie Dialogu - szczegółów 
class ModelDialogCard extends ConsumerWidget {
  // W konstruktorze przekazuje normalnie model - Nie wiem czy dobrze czy moze trzeba by było użyć jakiegoś providera
  const ModelDialogCard({super.key,required this.model});
  final Model model; 


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Widget, który służy do przekonwertowania formatu imgBase64, który jest użyty w modelu do obrazka
    Widget imageWidget;
    if (model.imageBase64 != null && model.imageBase64!.isNotEmpty) {
      final bytes = base64Decode(model.imageBase64!);
      imageWidget = Image.memory(bytes, fit: BoxFit.cover, height: 200);
    } else {
      imageWidget = const Text("No image");
    }
    // Zwrócenie Dialogu
    return Dialog(
        insetPadding: EdgeInsets.all(10),
        elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text("Date of the request"),
        Text(model.formatDate()),
        Text("The timeframes of the highlights below"),
        Text(model.timestamp.toString()),
        // Stworzenie boxu dla obrazka
        const SizedBox(height: 16),
        imageWidget
        ]
      ),
    );
  }
}