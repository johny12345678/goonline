import 'package:goonline_app/features/task_managment/data/datasource/database.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class TaskDatasource {
  Future<List<TaskModel>> loadTask();
  Future<void> editTask(TaskModel task);
  Future<void> addTask(TaskModel task);
  Future<void> removeTask(int id);
}

class TaskDatasourceImpl extends TaskDatasource {
  final DBhelper _database = DBhelper();

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      final database = await _database.db;
      await database.insert('tasks', task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> editTask(TaskModel task) async {
    try {
      final database = await _database.db;
      await database.update('tasks', task.toJson(),
          where: 'id = ? ',
          whereArgs: [task.id],
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TaskModel>> loadTask() async {
    try {
      final database = await _database.db;
      final response = await database.query('tasks');
      return List.generate(response.length, (index) {
        return TaskModel.fromJson(response[index]);
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeTask(int id) async {
    try {
      final database = await _database.db;
      await database.delete('tasks',
          where: 'id = ? ',
          whereArgs: [id],
      );
    } catch (e) {
      throw Exception(e);
    }
}
}

