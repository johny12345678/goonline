import 'package:flutter/material.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/widgets/appbar_widget.dart';
import 'package:goonline_app/widgets/drawer_widget.dart';


class DoneScreen extends StatelessWidget {
  final String title;

  const DoneScreen({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
         appbarWidget(context, title, AppColors.green),
        ],),
      drawer: drawer(context),
    );
    
   
}
}

