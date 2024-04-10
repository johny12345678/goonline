import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class BlurDialog extends StatelessWidget {

final String title;
final String content;
final Function continueCallBack;

const BlurDialog({super.key, required this.title, required this.content, required this.continueCallBack});

   

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child:  AlertDialog(
      title:  Text(title),
      content:  Text(content,),
      actions: <Widget>[
         TextButton(
          child: const Text("Continue"),
           onPressed: () {
            continueCallBack();
            Navigator.of(context).pop();
          },
        ),
         TextButton(
          child: const Text(
            "Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      ));
  }
}