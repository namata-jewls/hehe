import 'package:flutter/material.dart';
import 'slambookForm.dart';

void main() {
  runApp(const InteractiveApp());
}

class InteractiveApp extends StatelessWidget {
  const InteractiveApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 4 - User Interactive App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark
        ),
        appBarTheme: const AppBarTheme(color: Colors.black),),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4", style: TextStyle(color: Colors.white)),
        ),
        // create scrollable widget that has the form as a child
        body: const SingleChildScrollView(
          child: SlambookForm()
        )
      )
    );
  }
}
