import 'package:either_dart/either.dart';
import 'package:goonline_app/features/task_managment/data/repository/task_repository.dart';

class LoadTaskUsecase {
  final TaskRepository taskRepository;
  LoadTaskUsecase({required this.taskRepository});

Future<Either<Exception, void>> call() async =>
  await taskRepository.loadTask();


}