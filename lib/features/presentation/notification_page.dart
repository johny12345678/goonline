import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goonline_app/features/shared/widgets/drawer_widget.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/appbar_widget.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

class NotificationPage extends StatelessWidget {
  final String title; 
  final String notification;
  const NotificationPage({
    super.key, required this.title, required this.notification,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      
      body: Column(
        children: [
          appbarWidget(context, title, AppColors.green),
          Padding(padding: Paddings.horizontal40vertical20, child: Text(notification,
            style: poppins25menu,),)
        ],
      ),
      drawer: drawer(context),
    );
  }


}
