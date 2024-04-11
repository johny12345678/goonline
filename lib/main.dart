import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:goonline_app/dependency_injector/injector.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/add_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/edit_task_usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/load_task.usecase.dart';
import 'package:goonline_app/features/task_managment/domain/usecases/remove_task_usecase.dart';
import 'package:goonline_app/features/task_managment/presentation/bloc/task_bloc.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/add_task_screen.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/dashboard_screens/done_screen.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/dashboard_screens/executing_screen.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/dashboard_screens/planned_screen.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/welcome_screen.dart';
import 'package:goonline_app/features/weather_display/domain/usecase/weather_usecase.dart';
import 'package:goonline_app/features/weather_display/presentation/weather_bloc.dart';
import 'package:goonline_app/geolocalization/geolocalization_device_access.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  Position position = await determinePosition();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => TaskBloc(
              locator<AddTaskUsecase>(),
              locator<EditTaskUsecase>(),
              locator<LoadTaskUsecase>(),
              locator<RemoveTaskUsecase>(),
            )),
    BlocProvider(
      create: (_) => WeatherBloc(locator<WeatherUsecase>())..add(LoadWeatherEvent(position)),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/done': (context) => const DoneScreen(
              title: "Done",
            ),
        '/executing': (context) => const ExecutingScreen(title: "Executing"),
        '/planned': (context) => const PlannedScreen(title: "Planned"),
        '/addtask': (context) => const AddTaskScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeSplashScreen(),
    );
  }
}
