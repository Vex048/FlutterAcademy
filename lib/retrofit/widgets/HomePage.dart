import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/image_video_handling/frames_extracting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_read.dart';
import 'ModelList.dart';
import 'DrawerWidget.dart';
import '../image_video_handling/img_picker.dart';


final nameProvider = Provider<String>((ref) => "Marcin :)");


// Stworzenie fileProvidera, którego zadaniem jest zarządzanie przesyłanym obrazem z pliku
final fileProvider = StateNotifierProvider<ImageVideoHandler,XFile?>((ref) => ImageVideoHandler());

// provider, który sprwdza czy jest zaznaczony image czy video - jako bool
final isVideoProvider  = StateProvider<bool>((ref) => false);


// Frame provider, który będzie sprawdzał czy przesłane zostało video - jeśli tak, to wyekstraktuje pierwszką klatkę z video
final frameProvider = FutureProvider.family<Uint8List?, XFile>((ref, videoFile) async {
  return await getFrameAt(videoFile);
});



// Klasa posiadająca metody, które zmieniają stan fileProvidera 
class ImageVideoHandler extends StateNotifier<XFile?>{
  ImageVideoHandler(): super(null);

  void addFile(XFile? img) => state = img;

  void removeFile() => state = null;
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
              final isVideo = ref.watch(isVideoProvider);
              
              // Nasłuchiwanie na zmiany stanu imageProvidera
              final image = ref.watch(fileProvider);
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
                // Flaga, która sprawdza czy to jest video czy image
                  if (isVideo) {
                    // Śledzimy frameProvider w poszuiwaniu zmiany stanu - jeżeli taka nastąpiała to dostajemy zwrot z funkcji, która jest typu AsyncValue<Uint8List?>
                    final frameAsyncValue = ref.watch(frameProvider(image));
                    // Przez to że frameAsyncValue ma typ - AsyncValue<Uint8List? to trzeba użyć when() i rozbić na przypadki data,error,loading
                    return frameAsyncValue.when(
                      // Sprawdzenie czy data nie jest nullem - jeżeli nie to wyświetlamy pierwsza klatkę // BoxFit.cover -> BoxFit.contain zeby bylo wiodac wszystko
                      data: (frame) => frame != null ? Image.memory(frame,width: 400, height: 400, fit: BoxFit.contain) : Text("There is no frame in a video"),
                      // Bład
                      error: (err,s) => Text("There was an erorr while processing an Video:  $err"), 
                      // Jakieś kólko jak sie ładuje
                      loading: () => CircularProgressIndicator(),
                      );
                    }
                    else {
                        return Image.file(File(image.path), width: 400, height: 400, fit: BoxFit.cover);
                }
                  }
              }
            ),  
            ListTile(
              leading: Radio<bool>(
                value: false,
                groupValue: ref.watch(isVideoProvider),
                onChanged: (val) => ref.read(isVideoProvider.notifier).state = val!,
              ),
              title: const Text('Image'),
            ),
            ListTile(
              leading: Radio<bool>(
                value: true,
                groupValue: ref.watch(isVideoProvider),
                onChanged: (val) => ref.read(isVideoProvider.notifier).state = val!,
              ),
              title: const Text('Video'),
            ),     
            Row(
            // Rząd Przycisków do wybrania obrazu lub usunięcia obrazu
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FloatingActionButton(
              heroTag: 'pickImageBtn',
              onPressed: () async {
                // Wybranie obrazu lub video
                final isVideo = ref.read(isVideoProvider);
                final picked = isVideo ? await pickVideo() : await pickImage();
              // Powiadomienie o zmianie stanu imageProvidera 
              ref.read(fileProvider.notifier).addFile(picked);
            },
          tooltip: 'Pick Image or Video from Gallery',
          child: const Icon(Icons.photo),
          ),
          const SizedBox(width: 16), // Zeby byla przerwa
          FloatingActionButton(
            heroTag: 'removeImageBtn',
            // Powiadomienie o zmianie stanu fileProvidera 
            onPressed: () => ref.read(fileProvider.notifier).removeFile(),
          tooltip: 'Remove image or video',
          child: const Icon(Icons.delete)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
