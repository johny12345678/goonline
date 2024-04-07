import 'package:flutter/material.dart';
import 'package:goonline_app/consts/priority.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/widgets/appbar_widget.dart';
import 'package:goonline_app/widgets/drawer_widget.dart';
import 'package:goonline_app/widgets/each_task_todo.dart';

class PlannedScreen extends StatelessWidget {
  final String title; // TODO title will be provided from database
  const PlannedScreen({super.key, required this.title});

  @override
     Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
         appbarWidget(context, title, AppColors.blue),
         SizedBox(height: 25,),
         
         eachTaskWidget(
          context,
         1,
         "Zrobic aplikacje",
         "milosz",
         DateTime(2025, 1, 23),
         "Robie wlasnie aplikacje",
         Prio.high),
            eachTaskWidget(
          context,
         2,
         "aplikcja nie gotowa",
         "milosz",
         DateTime(2024, 8, 23),
         "jutro pisze backend",
         Prio.medium)
        ],),
      drawer: drawer(context),
      
    );


}
}

 

