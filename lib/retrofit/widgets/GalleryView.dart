import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'DrawerWidget.dart';



// Gallery View - tu będzie można wybrać folder z zapisanymi highlightami  -  In Progress
class GalleryView extends ConsumerWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Gallery View"),
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Text("Gallery content goes here"),
      ),
    );
  }
}