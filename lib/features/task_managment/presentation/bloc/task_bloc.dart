import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
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

  TaskBloc(
    this.addTaskUsecase,
    this.editTaskUsecase,
    this.loadTaskUsecase,
    this.removeTaskUsecase,
  ) : super(const TaskInitState()) {
    on<LoadTaskEvent>(_loadTask);
    on<AddTaskEvent>(_addTask);
    on<EditStatusEvent>(_editStatusTask);
    on<RemoveTaskEvent>(_removeTask);
    on<EditTaskEvent>(_editTask);
    on<SortTaskEvent>(_sortBy);
  }

  FutureOr<void> _loadTask(LoadTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoadingState());
    final result = await loadTaskUsecase.call();
    result.fold((left) => emit(TaskFailedState(left.toString())),
        (tasks) => emit(TaskLoadedState(tasks)));
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoadingState());
    final result = await addTaskUsecase.call(event.task);
    result.fold((left) => emit(TaskFailedState(left.toString())), (right) {
      add(const LoadTaskEvent());
    });
  }

  FutureOr<void> _editStatusTask(
      EditStatusEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoadingState());
    TaskModel updated = event.task.copyWith(status: event.status);
    final result = await editTaskUsecase.call(updated);
    result.fold((left) => emit(TaskFailedState(left.toString())), (right) {
      add(const LoadTaskEvent());
    });
  }

  FutureOr<void> _removeTask(
      RemoveTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoadingState());
    final result = await removeTaskUsecase.call(event.id);
    result.fold((left) => emit(TaskFailedState(left.toString())),
        (right) => add(const LoadTaskEvent()));
  }

  FutureOr<void> _editTask(EditTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoadingState());

    TaskModel updated = event.task.copyWith(
        taskName: event.task.taskName,
        taskDescription: event.task.taskDescription,
        deadline: event.task.deadline,
        prio: event.task.prio,
        owner: event.task.owner);
    final result = await editTaskUsecase.call(updated);
    result.fold((left) => emit(TaskFailedState(left.toString())), (right) {
      add(const LoadTaskEvent());
    });
  }

  FutureOr<void> _sortBy(SortTaskEvent event, Emitter<TaskState> emit) {

          emit(const TaskLoadingState());
      

       List<TaskModel> sorted = event.listToSort;

        switch(event.sortBy){
        case 'deadline' : 
        sorted.sort((a, b) => a.deadline.compareTo(b.deadline)); 
        break;
        case 'owner' :
        sorted.sort(((a, b) => a.owner.compareTo(b.owner)));
        break;
        case 'prio' :
        sorted.sort((a, b) => a.prio.compareTo(b.prio));
        break;
        default : break;
      }
      if(!event.lowToHgh){
        sorted = sorted.reversed.toList();
      }
     
      
      emit(TaskLoadedState(sorted));
    }

  
}
