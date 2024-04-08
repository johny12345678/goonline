import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/domain/entity/task_entity.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {

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
