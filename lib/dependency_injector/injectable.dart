import 'package:get_it/get_it.dart';
import 'package:goonline_app/features/notifications/service/notification_service.dart';
import 'package:goonline_app/features/task_managment/data/datasource/task_datasource.dart';
import 'package:goonline_app/features/task_managment/data/repository/task_repository.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/add_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/edit_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/load_task.usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/remove_task_usecase.dart';
import 'package:goonline_app/features/weather_display/data/datasource/weather_datasource.dart';
import 'package:goonline_app/features/weather_display/data/repository/weather_repository.dart';
import 'package:goonline_app/features/weather_display/domain/usecase/weather_usecase.dart';

GetIt locator = GetIt.instance;

void setupLocators() {
  final TaskDatasource datasourceTaskBloc = TaskDatasourceImpl();
  final WeatherDatasource datasourceWeatherBloc = WeatherDatasourceImpl();

  //Repositories
  locator.registerSingleton<TaskRepository>(TaskRepositoryImpl(datasourceTaskBloc));
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(datasourceWeatherBloc));

  //Usecases
  locator.registerSingleton<AddTaskUsecase>(AddTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<EditTaskUsecase>(EditTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<LoadTaskUsecase>(LoadTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<RemoveTaskUsecase>(RemoveTaskUsecase(taskRepository: locator()));
  locator.registerSingleton<WeatherUsecase>(WeatherUsecase(repository: locator()));
  locator.registerSingleton<NotificationService>(NotificationService());

}