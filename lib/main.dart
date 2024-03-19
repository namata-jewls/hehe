import 'package:exer5_app/friends.dart';
import 'package:exer5_app/summaryData.dart';
import 'package:flutter/material.dart';
import 'package:exer5_app/slambookForm.dart';

void main() {
  runApp(InteractiveApp());
}

class InteractiveApp extends StatelessWidget {
  const InteractiveApp({super.key});
  // static list for storing the saved data
  static List<SummaryData> summaryData = [];

  // root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 5 - Menu and Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark
        ),
        appBarTheme: const AppBarTheme(color: Colors.black)
      ),
      home: FriendsPage(summaries: summaryData), // originally shows the friends page
      initialRoute: "/",
      onGenerateRoute: (settings) {
        // the subroutine that determines what page to display
        if (settings.name == '/'){
          final args = settings.arguments as List<SummaryData>;
          return MaterialPageRoute(builder: (context) => FriendsPage(summaries: args));
        }
        else if(settings.name == "/second"){
          return MaterialPageRoute(builder: (context) => SlambookForm());
        }

        return null;
      },
    );
  }
}
