import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/screen_agencies.dart';
import 'package:workforce_project/view/screen_agentregister.dart';
import 'package:workforce_project/view/screen_availablemanagers.dart';
import 'package:workforce_project/view/screen_availableworkers.dart';
import 'package:workforce_project/view/screen_changepassword.dart';
import 'package:workforce_project/view/screen_login.dart';
import 'package:workforce_project/view/screen_managers.dart';
import 'package:workforce_project/view/screen_messages.dart';
import 'package:workforce_project/view/screen_register.dart';
import 'package:workforce_project/view/screen_reportissue.dart';
import 'package:workforce_project/view/screen_signup.dart';
import 'package:workforce_project/view/screen_workers.dart';
import 'package:workforce_project/viewmodel/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkProvider>(
          create: (context) {
            return WorkProvider();
          },
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: ScreenAvailableWorkers()),
    );
  }
}
