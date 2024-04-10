import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goonline_app/consts/enums.dart';
import 'package:goonline_app/themes/boxes.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

Widget eachPlannedTaskWidget(BuildContext context, int id, String taskName,
    String owner, DateTime deadline, String description, Prio prio) {
  return Column(
    children: [
      listIdPriorityDaysleft(context, id, deadline, prio),
      listNameAndDescriptionContainter(context, taskName, owner, description),
    ],
  );
}

Widget listIdPriorityDaysleft(
    BuildContext context, int id, DateTime deadline, Prio prio) {
  return Padding(
    padding: Paddings.horizontal20vertical10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${id}'),
        Icon(color: priorityLevelColor(prio), CupertinoIcons.chart_bar),
        Text(
            style: TextStyle(color: daysLeftColor(mathDaysLeft(deadline))),
            'days left: ${mathDaysLeft(deadline)}'),
      ],
    ),
  );
}

Widget listNameAndDescriptionContainter(
    BuildContext context, String taskName, String owner, String description) {
  final width = MediaQuery.of(context).size.width;
  return Padding(
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
              child: Text(softWrap: true, description),
            ),
          ],
        ),
      ),
    ),
  );
}

String nameAndOwner(String taskName, String owner) {
  return '$taskName ($owner)';
}

String mathDaysLeft(DateTime deadline) {
  Duration difference = deadline.difference(DateTime.now());
  final daysLeft = difference.inDays;

  if (daysLeft < 0) {
    return "0";
  }
  return daysLeft.toString();
}

//return color of 'dayltleft' depends of task deadline
Color daysLeftColor(String days) {
  int value = int.parse(days);
  if (value < 3) {
    return AppColors.red;
  }
  return Colors.black;
}

//return color of 'priority' icon depends of priority chosen
Color priorityLevelColor(Prio prio) {
  switch (prio) {
    case Prio.low:
      return AppColors.green;
    case Prio.medium:
      return AppColors.orange;
    case Prio.high:
      return AppColors.red;
    default:
      Prio.low;
      return AppColors.green;
  }
}
