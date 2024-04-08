import 'package:either_dart/either.dart';
import 'package:goonline_app/features/task_managment/data/models/task_model.dart';
import 'package:goonline_app/features/task_managment/data/repository/task_repository.dart';

class EditTaskUsecase {
  final TaskRepository taskRepository;
  EditTaskUsecase({required this.taskRepository});

Future<Either<Exception, void>> call(TaskModel task) async =>
  await taskRepository.editTask(task);

}