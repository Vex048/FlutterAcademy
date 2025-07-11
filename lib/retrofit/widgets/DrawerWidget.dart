import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit/widgets/FetchDataPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'HomePage.dart';
import 'ModelList.dart';
import 'GalleryView.dart';


// Konstrukcja DrawerWidget, który jest hamburgerem w lewym górnym rogu i pozwala na na navigacje między kartami
class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
              // Zniknięcie Draweru
              Navigator.pop(context); 
              // Przejście do MyHomePage()
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Home Highlight App")),
              );
              } ,
            ),
            ListTile(
              title: Text("Fetch Data"),
              onTap: () {
              Navigator.pop(context); 
              // Przejście do FetchDataPage()
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FetchDataPage(title: "Page for fetching data")),
              );
              } ,
            ),
              ListTile(
              title: Text("Gallery View"),
              onTap: () {
              Navigator.pop(context); 
              // Przejście do GalleryView()
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GalleryView()),
              );
              } ,
            )
        ],
      ),
    );
  }
}