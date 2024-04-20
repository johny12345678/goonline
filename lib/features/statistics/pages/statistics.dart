
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';

class TaskStatisticsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Statistics')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadedState) {
            return _buildStatisticsView(state.taskList);
          } else if (state is TaskLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Failed to load tasks or no tasks available.'));
          }
        },
      ),
    );
  }

Widget _buildStatisticsView(List<TaskModel> tasks) {
  final tasksByStatus = groupTasksByStatus(tasks);
  final upcomingTasks = getUpcomingTasks(tasks);

  return ListView(
    children: [
      ListTile(
        title: Text('Tasks by Status'),
        subtitle: Text(
          'Planned: ${tasksByStatus[1]?.length ?? 0},'
          'Executing: ${tasksByStatus[2]?.length ?? 0},'
          ' Done: ${tasksByStatus[3]?.length ?? 0}',
        ),
      ),
      ListTile(
        title: Text('Upcoming Tasks'),
        subtitle: Text(upcomingTasks.map((t) => t.taskName).join(', ')),
      ),

    ],
  );
}

Map<int, List<TaskModel>> groupTasksByStatus(List<TaskModel> tasks) {
  Map<int, List<TaskModel>> map = {1: [], 2: [], 3: []};
  for (var task in tasks) {
    map[task.status]?.add(task);
  }
  return map;
}

List<TaskModel> getUpcomingTasks(List<TaskModel> tasks) {
  return tasks.where((t) => t.deadline > DateTime.now().millisecondsSinceEpoch).toList();
}}