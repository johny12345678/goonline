part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTaskEvent extends TaskEvent {
  const LoadTaskEvent();
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel task;
  const AddTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class EditStatusEvent extends TaskEvent {
  final int status;
  final TaskModel task;
  const EditStatusEvent(this.task, this.status);
  @override
  List<Object?> get props => [task, status];
}

class RemoveTaskEvent extends TaskEvent {
  final int id;
  const RemoveTaskEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class EditTaskEvent extends TaskEvent {
  final TaskModel task;
  const EditTaskEvent(this.task,);
  @override
  List<Object?> get props => [task];
}