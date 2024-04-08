import 'package:flutter/material.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

            
      
      ),
      
      body: const Padding(
        padding: Paddings.horizontal30vertical10,
        child: Text(
          style: poppins25menu,
          'AddTaskScreen'),
      ),);
  }
}
