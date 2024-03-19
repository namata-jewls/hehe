import 'package:exer5_app/main.dart';
import 'package:exer5_app/summaryData.dart';
import 'package:flutter/material.dart';

// Drawer Widget used on Slambook and Friends Pages
class DrawerWidget extends StatefulWidget {
  final List<SummaryData>? summaries;
  const DrawerWidget({this.summaries, super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // Uses ListView for the child of the drawer widget
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text("Exercise 5: Menu, Routes, and Navigation",
              style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
            )
          ),
          // Has 2 ListTiles that contains the navigation routes
          ListTile(
            title: const Text("Friends"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/", arguments: InteractiveApp.summaryData);
            },
          ),
          ListTile(
            title: const Text("Slambook"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/second");
            },
          )
        ],
      ),
    );
  }
}
