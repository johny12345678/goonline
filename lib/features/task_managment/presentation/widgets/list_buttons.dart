    import 'package:flutter/material.dart';
import 'package:goonline_app/themes/button_styles/button_styles.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/blured_dialog.dart';

Widget listButtons(BuildContext context, String title1, String title2, VoidCallback button1Action, VoidCallback button2Action){
      return Padding(
             padding: Paddings.horizontal30vertical5,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ElevatedButton(
              style: finishTaskButton,
              onPressed: () => _showAlertDialog(context, button1Action), 
              child:  Text(title1)),
                ElevatedButton(
              style: deleteTaskButton,
              onPressed: () => _showAlertDialog(context, button2Action), 
              child:  Text((title2),
                style: addTaskButtonTextStyle,
                ))
              
             ],),
           );
    }
    
      void _showAlertDialog(BuildContext context, VoidCallback buttonAction,) {
  
  BlurDialog continueDialog = BlurDialog(title: 'Continue', content: "Are u sure?", continueCallBack: buttonAction);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return continueDialog;
    },
  );
}
