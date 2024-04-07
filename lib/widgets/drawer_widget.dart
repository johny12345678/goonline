import 'package:flutter/material.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

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
        onTap: () {},
      ),
       ListTile(
        leading: const Icon(Icons.abc_outlined),
        title: const Text('Edit tast'),
        onTap: () {},
      ),
       ListTile(
        leading: const Icon(Icons.abc_outlined),
        title: const Text('Statistics'),
        onTap: () {},
      ),
    ],);
}

