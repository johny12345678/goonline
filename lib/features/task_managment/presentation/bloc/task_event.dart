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
  final TaskEntity task;
  const AddTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class EditTaskEvent extends TaskEvent {
  final TaskEntity id;
  const EditTaskEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class RemoveTaskEvent extends TaskEvent {
  final int id;
  const RemoveTaskEvent(this.id);
  @override
  List<Object?> get props => [id];
}
