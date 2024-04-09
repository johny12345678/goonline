import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/consts/enums.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/add_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/edit_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/load_task.usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/remove_task_usecase.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';



class AddTaskScreen extends StatefulWidget {
   const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Prio _prio = Prio.low;
  DateTime? initDate = DateTime.now();
  final TextEditingController _controllerTaskName = TextEditingController();
  final TextEditingController _controllerTaskDescription =
      TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerOwner = TextEditingController();
  final status = 1;

  String taskName = '';
  String taskDescription = '';
  DateTime? taskDate;
  Prio? prio;
  String taskOwner = '';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text(style: poppins25menu, 'Add new task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: Paddings.all20,
            child: Column(
              children: <Widget>[
                taskNameDescriptionOwnerChoose(context),
                const SizedBox(
                  height: 20,
                ),
                dateChoose(context),
                const SizedBox(
                  height: 20,
                ),
                priorityChoose(context),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    
                      
                      taskName = _controllerTaskName.text;
                      taskDescription = _controllerTaskDescription.text;
                      taskDate = initDate;
                      prio = _prio;
                      taskOwner = _controllerOwner.text;
                      status;
                      final newTask = TaskModel(
                        0,
                        taskName: taskName, 
                        taskDescription: taskDescription, 
                        deadline: taskDate!, 
                        prio: prio!, 
                        owner: taskOwner, 
                        status: status);
                    BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(newTask));
                    Navigator.of(context).pop;
                  },
                  child: const Text('Add Task'),
                ),
              ],
            )),
      ),
    );
  }

  Widget taskNameDescriptionOwnerChoose(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controllerOwner,
          decoration: const InputDecoration(labelText: 'Task owner'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _controllerTaskName,
          decoration: const InputDecoration(labelText: 'TaskName'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _controllerTaskDescription,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Task Description',
          ),
        ),
      ],
    );
  }

  Widget dateChoose(BuildContext contex) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.calendar_today_outlined),
        labelText: "Choose deadline",
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusColor: AppColors.blue,
      ),
      controller: _controllerDate,
      readOnly: true,
      onTap: () {
        _selectDate();
      },
    );
  }

  Widget priorityChoose(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(style: poppins18, "Choose your task priority:"),
        RadioListTile<Prio>(
          title: const Text('Low'),
          value: Prio.low,
          groupValue: _prio,
          onChanged: (Prio? value) {
            setState(() {
              _prio = value!;
            });
          },
        ),
        RadioListTile<Prio>(
          title: const Text('Medium'),
          value: Prio.medium,
          groupValue: _prio,
          onChanged: (Prio? value) {
            setState(() {
              _prio = value!;
            });
          },
        ),
        RadioListTile<Prio>(
          title: const Text('High'),
          value: Prio.high,
          groupValue: _prio,
          onChanged: (Prio? value) {
            setState(() {
              _prio = value!;
            });
          },
        ),
      ],
    );
  }

  //Dialog with date
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      setState(() {
        initDate = pickedDate;
        _controllerDate.text = pickedDate.toString().split(' ')[0];
      });
    }
  }
}




