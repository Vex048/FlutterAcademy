
import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/api/model.dart';
import 'package:flutter_application_1/retrofit/widgets/ModelDialogCard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'DrawerWidget.dart';




// ModelsProvider zarządza listą modeli 
final modelsProvider = StateNotifierProvider<ModelsNotifier, List<Model>>((ref) => ModelsNotifier());

// dziedzicczy po StateNotifier listy modeli, więc tak naprawdę nimi zarządza (chyba)
class ModelsNotifier extends StateNotifier<List<Model>> {
  ModelsNotifier() : super([]);
  // Metody do zarządzania Listą modeli 
  void addModel(Model model) => state = [...state, model];
  void removeModel(Model model) => state = state.where((m) => m != model).toList();

}


// Tworzenie Widgetu ModelList
class ModelList extends ConsumerWidget {
  const ModelList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Monitorowanie czy modelsProvider nie zmienia stanu. Jesli tak to się przebudowywuje ( z tego co rozumiem )
    final models = ref.watch(modelsProvider);
    if (models.isEmpty){
      return Center(
        child: Text("No API calls yet",
      style: TextStyle(color: Colors.grey)));
    }
    // Expanend jest Elastyczny i można go przez to scrollować gdy będzie za duży
    return Expanded(
      // Widok Listy
    child: ListView.builder(
      padding: const EdgeInsets.all(8),
      // Zliczanie długośći - w sumie nie wiem po co
      itemCount: models.length,
      // Tworzy scrollowalną listę widgetów, które mają przydzielony swój indeks
      itemBuilder: (BuildContext context, int index){
        final model = models[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            elevation: 3,
            // Jakiś widget listTile
            child: ListTile(
              // Jeśli wciśniemy dany widget to przeniesie nas do Model Dialogu ze szczegółami
              onTap: (){
                showDialog(context: context, builder: (context) => ModelDialogCard(model: model));
              },
              // Ikonka
              leading: const Icon(Icons.history, color: Colors.blueAccent),

              title: Text(
                // Zformatowana data
                model.formatDate(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                // Lista timestampów "highlitsów"
                model.timestamp.toString(),
              ),
              // Przycsik do usunięcia z listy requestów
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {
                  ref.read(modelsProvider.notifier).removeModel(model);
                },
              ),
            ),
          );
      }
    )
    );
  }

}