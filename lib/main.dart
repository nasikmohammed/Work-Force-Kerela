import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_add_workers.dart';
import 'package:workforce_project/view/user/screen_login.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/view/user/screen_user_loginupadate.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';

import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          ),
          ChangeNotifierProvider<FunProvider>(
            create: (context) {
              return FunProvider();
            },
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ScreenUserLogin()));
  }
}
