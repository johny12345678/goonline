import 'package:flutter/material.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

Widget appbarWidget (BuildContext context, String title, Color color){
       return  SafeArea(
         child: Padding(
           padding: Paddings.bot15,
           child: AppBar(
            iconTheme: const IconThemeData(color: AppColors.white),
            backgroundColor: color,
            shadowColor: Colors.black87,
            elevation: 10,
            title: Text(
              style: 
              poppins25appbar,
              title)),
         ),
       );
}

  