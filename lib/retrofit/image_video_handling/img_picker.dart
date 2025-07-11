import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Metody, które używają biblioteki image_picker do wybierania z plików Obrazów oraz Video


// asynchroniczna Metoda, która zwraca obraz wybrany z galerii
Future<XFile?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image;
}
// asynchroniczna Metoda, która zwraca video wybrane z galerii
Future<XFile?> pickVideo() async {
  final ImagePicker picker = ImagePicker();
  final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
  return video;
}

