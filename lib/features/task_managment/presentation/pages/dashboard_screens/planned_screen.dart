import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/add_task_screen.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';
import 'package:goonline_app/utils/utils.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/appbar_widget.dart';
import 'package:goonline_app/features/shared/widgets/drawer_widget.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/each_planned_task.dart';
import 'package:goonline_app/features/task_managment/presentation/widgets/list_buttons.dart';

class PlannedScreen extends StatefulWidget {
  final String title; // TODO title will be provided from database
  const PlannedScreen({super.key, required this.title});

  @override
  State<PlannedScreen> createState() => _PlannedScreenState();
}

class _PlannedScreenState extends State<PlannedScreen> {
  @override
  String sortKey = "id";

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbarWidget(context, widget.title, AppColors.blue),
          listOfTasks(context),
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
          final list = state.taskList
              .where(
                (element) => element.status == 1,
              )
              .toList();
          return Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: Paddings.bot15,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddTaskScreen(
                                      taskToEdit: list[index],
                                    ))),
                        child: eachPlannedTaskWidget(
                          context,
                          index + 1,
                          list[index].taskName,
                          list[index].owner,
                          intToDate(list[index].deadline),
                          list[index].taskDescription,
                          intToPrio(
                            list[index].prio,
                          ),
                        ),
                      ),
                    ),
                    listButtons(
                      context,
                      "Move to executing",
                      "Delete",
                      () => context
                          .read<TaskBloc>()
                          .add(EditStatusEvent(list[index], 2)),
                      () => context
                          .read<TaskBloc>()
                          .add(RemoveTaskEvent(list[index].id)),
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

  Widget sortDialog(
    BuildContext context,
  ) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoadedState) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: Paddings.all20,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Low to hight: ",
                        style: poppins25menu,
                      ),
                      Switch(
                          value: value,
                          onChanged: (newValue) {
                            setModalState(() {
                              value = newValue;
                              print(value);
                            });
                          })
                    ],
                  ),
                  sortKeyChoose(context),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context
                            .read<TaskBloc>()
                            .add(SortTaskEvent(sortKey, state.taskList, value));
                      },
                      child: const Text(
                        "Sort",
                        style: poppins18,
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        }
        return const SizedBox();
      },
    );
  }

  Widget sortKeyChoose(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<String>(
            title: const Text('Sort by owner: '),
            value: 'owner',
            groupValue: sortKey,
            onChanged: (value) {
              setModalState(() {
                sortKey = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Sort by time left: '),
            value: 'deadline',
            groupValue: sortKey,
            onChanged: (value) {
              setModalState(() {
                sortKey = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Sort by priority: '),
            value: 'prio',
            groupValue: sortKey,
            onChanged: (value) {
              setModalState(() {
                sortKey = value!;
              });
            },
          ),
        ],
      );
    });
  }
}
              // FloatingActionButton(
              //         onPressed: () {
              //           showModalBottomSheet(
              //               context: context,
              //               builder: (context) {
              //                 return sortDialog(context);
              //               });
              //         },
              //       ),