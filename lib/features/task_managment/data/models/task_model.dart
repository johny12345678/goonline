import 'package:goonline_app/consts/enums.dart';
import 'package:goonline_app/features/task_managment/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
     super.id,
   { required super.taskName,
    required super.taskDescription,
    required super.deadline,
    required super.prio,
    required super.owner,
    required super.status});

  factory TaskModel.fromJson(Map<String, dynamic> data) => 
  TaskModel(
    data['id'],
    taskName: data['taskName'],
    taskDescription: data['taskDescription'],
    deadline: DateTime.fromMillisecondsSinceEpoch(data['deadline']), 
    prio: _intToPrio(data['prio']),
    owner: data['owner'],
    status: data['status']);

  TaskEntity toEntity() => 
  TaskModel(
    id, 
    taskName: taskName, 
    taskDescription: taskDescription, 
    deadline: deadline, 
    prio: prio, 
    owner: owner, 
    status: status);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = taskName;
    data['phone'] = taskDescription;
    data['city'] = deadline;
    data['prio'] = _prioToInt(prio);
    data['owner'] = owner;
    data['status'] = status;

    return data;
  }

  static int _prioToInt (Prio prio){
  switch (prio) {
    case Prio.low:
    return 1;
    case Prio.medium:
    return 2;
    case Prio.high:
    return 3;
    default :
    return 0;
  }
}

static Prio _intToPrio (int prioNumber){
  switch (prioNumber){
    case 1 :
    return Prio.low;
    case 2 : 
    return Prio.medium;
    case 3 :
    return Prio.high;
    default :
    return Prio.low;
  }
}


}

