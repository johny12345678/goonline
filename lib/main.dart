import 'package:flutter/material.dart';
import 'package:goonline_app/pages/add_task_screen.dart';
import 'package:goonline_app/pages/dashboard_screens/done_screen.dart';
import 'package:goonline_app/pages/dashboard_screens/executing_screen.dart';
import 'package:goonline_app/pages/dashboard_screens/planned_screen.dart';
import 'package:goonline_app/pages/welcome_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/done' : (context) => const DoneScreen(title: "Done",),
        '/executing' : (context) => const ExecutingScreen(title: "Executing"),
        '/planned' : (context) => const PlannedScreen(title: "Planned"), // TODO tittle will be provided from database
        '/addtask' : (context) => const AddTaskScreen(),
      },

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeSplashScreen(),
    );
  }
}

