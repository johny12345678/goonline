import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/domain/entity/task_entity.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/add_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/edit_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/load_task.usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/remove_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase addTaskUsecase;
  final EditTaskUsecase editTaskUsecase;
  final LoadTaskUsecase loadTaskUsecase;
  final RemoveTaskUsecase removeTaskUsecase;

  TaskBloc(this.addTaskUsecase, this.editTaskUsecase, this.loadTaskUsecase, this.removeTaskUsecase,)  : super(const TaskState()) {

    on<LoadTaskEvent>(_loadTask);
    on<AddTaskEvent>(_addTask);
    on<EditTaskEvent>(_editTask);
    on<RemoveTaskEvent>(_removeTask);

  }

  FutureOr<void> _loadTask(LoadTaskEvent event, Emitter<TaskState> emit) {

  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) {

  }

  FutureOr<void> _editTask(EditTaskEvent event, Emitter<TaskState> emit) {

  }

  FutureOr<void> _removeTask(RemoveTaskEvent event, Emitter<TaskState> emit) {

  }
}
