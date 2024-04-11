import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/utils/utils.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/appbar_widget.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/drawer_widget.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/each_planned_task.dart';

class DoneScreen extends StatelessWidget {
  final String title;

  const DoneScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      
      body: Column(
        children: [
          appbarWidget(context, title, AppColors.green),
          listOfTasks(context)
        ],
      ),
      drawer: drawer(context),
    );
  }

Widget listOfTasks(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskInitState) {
          context.read<TaskBloc>().add(const LoadTaskEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TaskLoadedState) {
          final list = state.taskList.where((element) => element.status == 3,).toList();
          return Expanded(
            
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: Paddings.bot15,
                      child: eachPlannedTaskWidget(
                          context,
                          index + 1,
                          list[index].taskName,
                          list[index].owner,
                          intToDate(
                              list[index].deadline), // przekazac date
                          list[index].taskDescription,
                          intToPrio(
                            list[index].prio,
                          ),
                 

                          ),
                       
                    ),
                         
                  ],
                );
              },
            ),
          );
        } else if (state is TaskLoadingState) {
          return const Column(
            children: [
              Center(
                child: Text("Waiting for data"),
              ),
              Center(child: CircularProgressIndicator())
            ],
          );
        } else if (state is TaskFailedState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const Text('out of state scope');
      },
    );
  }
}
