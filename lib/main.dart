import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/screen_splash.dart';
import 'package:workforce_project/view/admin/screen_register_onemployee.dart';
import 'package:workforce_project/view/agent/screen_add_manager.dart';
import 'package:workforce_project/view/agent/screen_agent_login.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/user/screen_register.dart';
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
            home: ScreenSplash()));
  }
}
//  apiKey: 'AIzaSyBeNrFCQjitZM87iSO3kA_UzKrTcRQuRkc',
//     appId: '1:817839298426:web:9af160100c1a20e61c28c3',
//     messagingSenderId: '817839298426',
//     projectId: 'work-force-kerala',
//     authDomain: 'work-force-kerala.firebaseapp.com',
//     storageBucket: 'work-force-kerala.appspot.com',
//     measurementId: 'G-J3NMVX4L9V',
//     databaseURL: 'https://work-force-kerala-default-rtdb.firebaseio.com',