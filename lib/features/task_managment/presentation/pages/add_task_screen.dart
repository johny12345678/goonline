import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/consts/enums.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';
import 'package:goonline_app/utils/utils.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskModel? taskToEdit;
  const AddTaskScreen({super.key, this.taskToEdit});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}
class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.taskToEdit != null) {
      _controllerTaskName.text = widget.taskToEdit!.taskName;
      _controllerTaskDescription.text = widget.taskToEdit!.taskDescription;
      initDate = dateFromDatabase(widget.taskToEdit!.deadline);
      _controllerOwner.text = widget.taskToEdit!.owner;
    }
  }

  Prio _prio = Prio.low;
  DateTime initDate = DateTime.now();
  final TextEditingController _controllerTaskName = TextEditingController();
  final TextEditingController _controllerTaskDescription =
      TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerOwner = TextEditingController();
  final status = 1;
  int id = 0;
  String taskName = '';
  String taskDescription = '';
  int? taskDateInMiliseconds;
  Prio? prio;
  int prioInt = 1;

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
                elevatedButtonAndLogic(context)
              ],
            )),
      ),
    );
  }


  Widget elevatedButtonAndLogic(BuildContext context) {
    return   ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    taskName = _controllerTaskName.text;
                    taskDescription = _controllerTaskDescription.text;
                    taskDateInMiliseconds = dateToDatabase(initDate);
                    prio = _prio;
                    taskOwner = _controllerOwner.text;
                    status;
                    if (widget.taskToEdit != null){
                        id = widget.taskToEdit!.id;
                    }
                    final newTask = TaskModel(id,
                        taskName: taskName,
                        taskDescription: taskDescription,
                        deadline: taskDateInMiliseconds!,
                        prio: prioInt,
                        owner: taskOwner,
                        status: status);
                    widget.taskToEdit == null
                        ? BlocProvider.of<TaskBloc>(context)
                            .add(AddTaskEvent(newTask))
                        : BlocProvider.of<TaskBloc>(context)
                            .add(EditTaskEvent(newTask));
                  },
                  child: widget.taskToEdit == null
                      ? const Text('Add task')
                      : const Text('Update task'),
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
              prioInt = 2;
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
              prioInt = 3;
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