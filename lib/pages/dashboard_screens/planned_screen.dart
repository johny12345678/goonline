import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goonline_app/consts/enums.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/widgets/appbar_widget.dart';
import 'package:goonline_app/widgets/drawer_widget.dart';
import 'package:goonline_app/widgets/each_planned_task_todo.dart';

class PlannedScreen extends StatelessWidget {
  final String title; // TODO title will be provided from database
  const PlannedScreen({super.key, required this.title});

  @override
     Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
         appbarWidget(context, title, AppColors.blue),  
         listOfTasks(context),
        ],),
      drawer: drawer(context),
      
    );


}

  Widget listOfTasks(BuildContext context) {
          return  Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
               return Column(
                  children: [
                    Padding(
                      padding: Paddings.bot15,
                      child: eachPlannedTaskWidget(
                                  context,
                                 1,
                                 "Zrobic aplikacje",
                                 "milosz",
                                 DateTime(2025, 1, 23),
                                 "Robie wlasnie aplikacje",
                                 Prio.high),
                    ),
                  ],
                );
            },
          ),
        ); 
  }
}

 

