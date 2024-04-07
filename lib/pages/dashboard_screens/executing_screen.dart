import 'package:flutter/material.dart';
import 'package:goonline_app/themes/colors.dart';

import 'package:goonline_app/widgets/appbar_widget.dart';
import 'package:goonline_app/widgets/drawer_widget.dart';

class ExecutingScreen extends StatelessWidget {
  final String title;
  
  const ExecutingScreen({super.key, required this.title});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
         appbarWidget(context, title, AppColors.orange),
        ],),
      drawer: drawer(context),
    );
    
   
}

}