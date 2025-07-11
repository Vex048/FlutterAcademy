import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/widgets/DrawerWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_read.dart';
import 'ModelList.dart';



class FetchDataPage extends ConsumerWidget {
  const FetchDataPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // Wystarczy tylko odczytać raz nameProvider nie musimy go "monitorować"
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
            Text("Hello, below are yours API calls"),
            // Odwołanie do komponentu ModelList()
            ModelList()
          ],
        ),
      ),
      // Przycisk, który wykonuje GET requesta do API
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final model = await callAPI();
          // Po wykonaniu requesta jest odświeżany modelsProvider w celu zaktualizowania Listy Requestów
          ref.read(modelsProvider.notifier).addModel(model);
          },
        tooltip: 'Fetch Model',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
