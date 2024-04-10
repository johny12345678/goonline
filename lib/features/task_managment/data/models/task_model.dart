import 'package:goonline_app/features/task_managment/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(super.id,
      {required super.taskName,
      required super.taskDescription,
      required super.deadline,
      required super.prio,
      required super.owner,
      required super.status});

  factory TaskModel.fromJson(Map<String, dynamic> data) => TaskModel(data['id'],
      taskName: data['taskName'],
      taskDescription: data['taskDescription'],
      deadline: data['deadline'],
      prio: data['prio'],
      owner: data['owner'],
      status: data['status']);

  TaskEntity toEntity() => TaskModel(id,
      taskName: taskName,
      taskDescription: taskDescription,
      deadline: deadline,
      prio: prio,
      owner: owner,
      status: status);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['taskName'] = taskName;
    data['taskDescription'] = taskDescription;
    data['deadline'] = deadline;
    data['prio'] = prio;
    data['owner'] = owner;
    data['status'] = status;

    return data;
  }

  TaskModel copyWith({
    int? id,
    String? taskName,
    String? taskDescription,
    int? deadline,
    int? prio,
    String? owner,
    int? status,
  }) {
    return TaskModel(id ?? this.id,
        taskName: taskName ?? this.taskName,
        taskDescription: taskDescription ?? this.taskDescription,
        deadline: deadline ?? this.deadline,
        prio: prio ?? this.prio,
        owner: owner ?? this.owner,
        status: status ?? this.status);
  }
}
