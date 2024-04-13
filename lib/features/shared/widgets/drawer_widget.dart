import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goonline_app/features/notifications/data/datasource.dart';
import 'package:goonline_app/features/presentation/notification_page.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/add_task_screen.dart';
import 'package:goonline_app/features/weather_display/presentation/weather_bloc.dart';
import 'package:goonline_app/themes/colors.dart';
import 'package:goonline_app/themes/paddings.dart';
import 'package:goonline_app/themes/text_styles/text_styles.dart';

// Drawer which is placed in appbar's of three main screens

Widget drawer(BuildContext context) {
  final height = MediaQuery.of(context).size.height * 0.5;
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        menuHeader(context),
        menuItems(context),
         SizedBox(height: height,),
        weather(context),
      ],
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
        leading: const Icon(CupertinoIcons.doc_text),
        title: const Text('Add new task'),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
      ),

       ListTile(
        leading: const Icon(CupertinoIcons.graph_circle),
        title: const Text('Statistics'),
        onTap: () {},
      ),
             Row(
             
               children: [
             
                    Expanded(
                      child: ListTile(
                             leading: const Icon(CupertinoIcons.graph_circle),
                             title: const Text('Notifications'),
                            
                             onTap: () {
                              
                              NotificationDatasource.pushNotification( title: 'notification title', body: 'description');},
                           
                                       ),
                    ),
                 const Icon(Icons.warning,),
                 const SizedBox(width: 100,),
               ],
             ),
             
    ],
  );
}

Widget weather(BuildContext context) {
  return BlocBuilder<WeatherBloc, WeatherState>(
    builder: (context, state) {
      if (state is LoadedWeatherState) {
        return Padding(
          padding: Paddings.all20,
          child: Column(
            children: [
              const Row( //TODO adjust ui with text + icons
  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     Padding(
                    padding: Paddings.horizontal20,
                    child: Icon(
                      color: AppColors.orange,
                      Icons.cloud),
                  ),
                   Text("Current weather: ",
                  style: poppins18bold),
                ],
              ),
              Text('${state.weather.areaName}'),
              Text('${state.weather.temperature}'),
              Text('${state.weather.weatherDescription}'),
            ],
            
          ),
        );
      } else if (state is InitWeatherState) {
      } else if (state is FailureWeatherState) {
        return const Column(
          children: [Text("error"), CircularProgressIndicator()],
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void onDidReceiveLocalNotification(BuildContext context, 
    int id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title??''),
      content: Text(body??''),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(notification: 'Notification',title: title!),
              ),
            );
          },
        )
      ],
    ),
  );
}