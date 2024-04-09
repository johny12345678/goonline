import 'package:equatable/equatable.dart';
import 'package:goonline_app/consts/enums.dart';

class TaskEntity extends Equatable {
  final int id;
  final String taskName;
  final String taskDescription;
  final DateTime deadline;
  final Prio prio;
  final String owner;
  final int status;

  const TaskEntity(this.id,{required this.taskName,required this.taskDescription,required this.deadline,required this.prio, required this.owner,required this.status});

  @override
  List<Object?> get props => [id, taskName, taskDescription, deadline, prio, owner, status];

}