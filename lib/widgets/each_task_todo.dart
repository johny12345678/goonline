   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goonline_app/consts/priority.dart';
import 'package:goonline_app/themes/boxes.dart';
import 'package:goonline_app/themes/button_styles/button_styles.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

Widget eachTaskWidget(BuildContext context, int id, String taskName, String owner, DateTime deadline, String description, Prio prio,) {
       final width = MediaQuery.of(context).size.width;
      return Column(        
        children: [
          Padding(
            padding: Paddings.horizontal20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('${id}'),          
              Icon(color: priorityLevelColor(prio),
                  CupertinoIcons.chart_bar),
              Text(
                style: TextStyle(color: daysLeftColor(mathDaysLeft(deadline))),
                'days left: ${mathDaysLeft(deadline)}'),
            ],
            ),
          ),
          const SizedBox(height: 10,),
           Padding(
             padding: Paddings.horizontal20,
             child: Container(
              width: width,
              decoration: listBoxDecoration(context),              
               child: Padding(
                 padding: Paddings.top10,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,                  
                  children: [
                    
                    Center(
                      child: Text(
                        (nameAndOwner(taskName, owner)),
                        style: listTitle,
                        ),
                    ),
                   
                    
                    Padding(
                      padding: Paddings.all10,
                      child: Text(
                        softWrap: true,
                        description),
                    ),
                    
                  
                  ],
                           ),
               ),

             ),
           ),

           Padding(
             padding: Paddings.horizontal40vertical20,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ElevatedButton(
              style: finishTaskButton,
              onPressed: () {}, 
              child: const Text("Done")),
                ElevatedButton(
              style: deleteTaskButton,
              onPressed: () {}, 
              child: const Text(
                style: addTaskButtonTextStyle,
                "Delete"))
              
             ],),
           ),
           

const SizedBox(height: 30,),
        ],
        
      );
      
    }

    String nameAndOwner(String taskName, String owner) {
    return '$taskName ($owner)';
    }

    String mathDaysLeft(DateTime deadline) {


        Duration difference = deadline.difference(DateTime.now());
        final daysLeft = difference.inDays;

        if (daysLeft < 0){
          return "0";
        }        
        return daysLeft.toString();
    }

    //return color of dayltleft depends of task deadline
    Color daysLeftColor(String days) {
     int value = int.parse(days);
     if (value < 150){
      return AppColors.red;
     }
     return AppColors.green;
     
    }


    //return color of priorityicon depends of priority chosen
    Color priorityLevelColor(Prio prio) {
      switch(prio) {
        case Prio.low :
        return AppColors.green;
        case Prio.medium :
        return AppColors.orange;
        case Prio.high :
        return AppColors.red;
        default : Prio.low;
        return AppColors.green;
      }
    }