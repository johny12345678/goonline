import 'package:either_dart/either.dart';
import 'package:goonline_app/features/task_managment/data/repository/task_repository.dart';

class RemoveTaskUsecase {
  final TaskRepository taskRepository;
  RemoveTaskUsecase({required this.taskRepository});

Future<Either<Exception, void>> call(int id) async =>
  await taskRepository.removeTask(id);


}