
import 'package:either_dart/either.dart';
import 'package:goonline_app/features/task_managment/data/datasource/task_datasource.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';

abstract class TaskRepository {
  Future <Either<Exception, List<TaskModel>>> loadTask();
  Future <Either<Exception, void>> editTask(TaskModel task);
  Future <Either<Exception, void>> addTask(TaskModel task);
  Future <Either<Exception, void>> removeTask(int id);
}


class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource taskDatasource;
  TaskRepositoryImpl(this.taskDatasource);


  @override
  Future<Either<Exception, void>> addTask(TaskModel task) async {
    try {final result = await taskDatasource.addTask(task);
      return Right(result);
    }catch (e){
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> editTask(TaskModel task) async {

    try {
      final result = await taskDatasource.editTask(task);
      return Right(result);

    }catch(e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, List<TaskModel>>> loadTask() async {
    try{
      final result = await taskDatasource.loadTask();
      return Right(result);
    }catch(e){
      return Left(Exception(e));
    }


  }

  @override
  Future<Either<Exception, void>> removeTask(int id) async {
    try{ 
      final result = await taskDatasource.removeTask(id);
      return Right(result);
    }catch(e){
      return Left(Exception(e));
    }
  }

}