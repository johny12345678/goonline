part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<TaskEntity> taskList;
  const TaskLoadedState(this.taskList);

  @override
  List<Object?> get props => [];
}

class TaskLoadingState extends TaskState {
  const TaskLoadingState();
  @override
  List<Object?> get props => [];
}

class TaskFailedState extends TaskState {
  final String errorMessage;
  const TaskFailedState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class TaskAddSuccessState extends TaskState {
  final TaskEntity task;
  const TaskAddSuccessState(this.task);
  @override
  List<Object?> get props => [task];
}

class TaskRemoveSuccessState extends TaskState {
  final TaskEntity task;
  const TaskRemoveSuccessState(this.task);
  @override
  List<Object?> get props => [task];
}
