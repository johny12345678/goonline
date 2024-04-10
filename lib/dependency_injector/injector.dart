import 'package:get_it/get_it.dart';
import 'package:goonline_app/features/task_managment/data/datasource/task_datasource.dart';
import 'package:goonline_app/features/task_managment/data/repository/task_repository.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/add_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/edit_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/load_task.usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/remove_task_usecase.dart';

GetIt locator = GetIt.instance;

void setupLocators() {
  final TaskDatasource datasource = TaskDatasourceImpl();
  locator.registerSingleton<TaskRepository>(TaskRepositoryImpl(datasource));
  locator.registerSingleton<AddTaskUsecase>(AddTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<EditTaskUsecase>(EditTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<LoadTaskUsecase>(LoadTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<RemoveTaskUsecase>(RemoveTaskUsecase(taskRepository: locator()));
  
}