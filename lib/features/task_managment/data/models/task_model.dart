import 'package:goonline_app/features/task_managment/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.taskName,
    required super.taskDescription,
    required super.deadline,
    required super.prio,
    required super.owner,
    required super.status});

  factory TaskModel.fromJson(Map<String, dynamic> data) => 
  TaskModel(
    id: data['id'],
    taskName: data['taskName'],
    taskDescription: data['taskDescription'],
    deadline: data['deadline'], prio: data['prio'],
    owner: data['owner'],
    status: data['status']);

  TaskModel toEntity() => 
  TaskModel(
    id: id, 
    taskName: taskName, 
    taskDescription: taskDescription, 
    deadline: deadline, 
    prio: prio, 
    owner: owner, 
    status: status);
}