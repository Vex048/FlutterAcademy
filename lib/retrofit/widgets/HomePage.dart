import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_read.dart';
import 'ModelList.dart';
import 'DrawerWidget.dart';
import '../image_handling/img_picker.dart';


final nameProvider = Provider<String>((ref) => "Marcin :)");


// Stworzenie imageProvidera, którego zadaniem jest zarządzanie przesyłanym obrazem z pliku
final imageProvider = StateNotifierProvider<ImageHandler,XFile?>((ref) => ImageHandler());


// Klasa posiadająca metody, które zmieniają stan imageProvidera 
class ImageHandler extends StateNotifier<XFile?>{
  ImageHandler(): super(null);

  void addImage(XFile? img) => state = img;

  void removeImage() => state = null;

}


// Klasa odpowiadająca za stworzenie Strony Domowej
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // Wystarczy tylko odczytać raz nameProvider nie musimy go "monitorować"
    final name = ref.read(nameProvider);
    // Zwracanie widoku stworzonego z komponentów
    return Scaffold(
      // Nagłówek (chyba)
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: const DrawerWidget(),
      // Główne ciało 
      body: Align(
        // Przyleganie do góry-środka
        alignment: Alignment.topCenter,
        child: Column(
          // tutaj chyba kolumna zajmie tyle miejsca co jej dzieci 
          mainAxisSize: MainAxisSize.min,
          // A tu wyśrodkowanie 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Home Page"),

            // Stworzenie widoku Consumera ( Tutaj nie wiem czy jest on w ogóle potrzebny )
            Consumer(builder: (context,ref,child){
              // Nasłuchiwanie na zmiany stanu imageProvidera
              final image = ref.watch(imageProvider);
              // Jeżeli stan naszego obrazu jest nullem to zwracamy pusty szary Container
              if (image == null) {
                return Container(
                  width: 400,
                  height: 400,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.image, size: 64, color: Colors.grey)),
                );
                // W innym przypadku zwracamy Image 
              } else {
                return Image.file(File(image.path), width: 400, height: 400, fit: BoxFit.cover);
                }
              }
            ),        
            Row(
            // Rząd Przycisków do wybrania obrazu lub usunięcia obrazu
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FloatingActionButton(
              heroTag: 'pickImageBtn',
              onPressed: () async {
                // Wybranie obrazu
              final img = await pickImage();
              // Powiadomienie o zmianie stanu imageProvidera 
              ref.read(imageProvider.notifier).addImage(img);
            },
          tooltip: 'Pick Image from Gallery',
          child: const Icon(Icons.photo),
          ),
          const SizedBox(width: 16), // Zeby byla przerwa
          FloatingActionButton(
            heroTag: 'removeImageBtn',
            // Powiadomienie o zmianie stanu imageProvidera 
            onPressed: () => ref.read(imageProvider.notifier).removeImage(),
          tooltip: 'Remove image',
          child: const Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
