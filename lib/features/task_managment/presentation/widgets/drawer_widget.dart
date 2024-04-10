import 'package:flutter/material.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/add_task_screen.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

// Drawer which is placed in appbar's of three main screens

Widget drawer(BuildContext context) {
    return  Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            menuHeader(context),
            menuItems(context),
          ],
        ),
      ),
    );
  }

Widget menuHeader(BuildContext context) {
    return const Column(
      children: [
         Center(

           child: Padding(padding: Paddings.top30bot10,
                   child: Text(
                    style: poppins25menu,
                    'Menu'),),
         ),
      ],
    );
    
}

  Widget menuItems(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.abc_outlined),
        title: const Text('Add new task'),
        onTap: () {Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const AddTaskScreen()));},
      ),

       ListTile(
        leading: const Icon(Icons.abc_outlined),
        title: const Text('Statistics'),
        onTap: () {},
      ),
    ],);
}

