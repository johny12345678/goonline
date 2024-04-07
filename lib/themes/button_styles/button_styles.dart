

import 'package:flutter/material.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';

ButtonStyle addTaskButton = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  backgroundColor: Colors.transparent,
  minimumSize: const Size(80, 40),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15))
  )
);

ButtonStyle finishTaskButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.green,
  padding: Paddings.horizontal20vertical5,
  elevation: 0,
  minimumSize: Size(40, 20),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15))
  )
);

ButtonStyle deleteTaskButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.red,
  padding: Paddings.horizontal20vertical5,
  minimumSize: const Size(80, 40),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15))
  )
);