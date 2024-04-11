import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/add_task_screen.dart';
import 'package:goonline_app/features/weather_display/presentation/weather_bloc.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

// Drawer which is placed in appbar's of three main screens

Widget drawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          menuHeader(context),
          menuItems(context),
          weather(context),
        ],
      ),
    ),
  );
}

Widget menuHeader(BuildContext context) {
  return const Column(
    children: [
      Center(
        child: Padding(
          padding: Paddings.top30bot10,
          child: Text(style: poppins25menu, 'Menu'),
        ),
      ),
    ],
  );
}

Widget menuItems(BuildContext context) {
  return Column(
    children: [
      ListTile(
        leading: const Icon(Icons.abc_outlined),
        title: const Text('Add new task'),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
      ),

      //  ListTile(
      //   leading: const Icon(Icons.abc_outlined),
      //   title: const Text('Statistics'),
      //   onTap: () {},
      // ),
    ],
  );
}

Widget weather(BuildContext context) {
  return BlocBuilder<WeatherBloc, WeatherState>(
    builder: (context, state) {
      if (state is LoadedWeatherState){
         return Padding(
           padding: Paddings.all20,
           child: Column(
                   children: [
           
            Row(
              children: [
                const Text("Weather: "),
                const Padding(
                  padding: Paddings.horizontal20,
                  child: Icon(Icons.cloud),
                ),
                Text('${state.weather.temperature}'),
                
              ],
            )
                   ],
                 ),
         );
      } else if (state is InitWeatherState){
        
      
        } else if (state is FailureWeatherState){
        return const Column(children: [
          Text("error"),
          CircularProgressIndicator()
        ],);
      }

     return const Center(child: CircularProgressIndicator(),);
    },
  );
}
