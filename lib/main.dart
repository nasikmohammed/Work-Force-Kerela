import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/admin/screen_admin_profile.dart';
import 'package:workforce_project/view/admin/screen_adminlogin.dart';
import 'package:workforce_project/view/admin/screen_feedback_reports.dart';
import 'package:workforce_project/view/admin/screen_human_resouce.dart';
import 'package:workforce_project/view/admin/screen_notifications.dart';
import 'package:workforce_project/view/admin/screen_pending_verification.dart';
import 'package:workforce_project/view/admin/screen_registeron_employee.dart';
import 'package:workforce_project/view/admin/screen_verifications.dart';
import 'package:workforce_project/view/admin/screen_verified_registrations.dart';
import 'package:workforce_project/view/agent/screen_aboutusagent.dart';
import 'package:workforce_project/view/agent/screen_agent_bottom.dart';
import 'package:workforce_project/view/agent/screen_changepasswordagent.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/agent/screen_notificationagent.dart';
import 'package:workforce_project/view/agent/screen_ongoingprojectagent.dart';
import 'package:workforce_project/view/agent/screen_settingsagent.dart';
import 'package:workforce_project/view/agent/screen_updateprofileagent.dart';
import 'package:workforce_project/view/agent/screen_upsaagent.dart';
import 'package:workforce_project/view/manager/screen_employee_details.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/manager/screen_manager_aboutus.dart';
import 'package:workforce_project/view/manager/screen_manager_change_password.dart';
import 'package:workforce_project/view/manager/screen_manager_messages.dart';
import 'package:workforce_project/view/manager/screen_manager_profile.dart';
import 'package:workforce_project/view/manager/screen_manager_reportproblems.dart';
import 'package:workforce_project/view/manager/screen_manager_settings.dart';
import 'package:workforce_project/view/manager/screen_manager_upsa.dart';
import 'package:workforce_project/view/manager/screen_managernotifications.dart';
import 'package:workforce_project/view/manager/screen_project_details.dart';
import 'package:workforce_project/view/manager/screen_yourproject.dart';
import 'package:workforce_project/view/police/screen_aboutus.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/view/police/screen_complaints.dart';
import 'package:workforce_project/view/police/screen_agencies.dart';
import 'package:workforce_project/view/agent/screen_agentregister.dart';
import 'package:workforce_project/view/police/screen_alert.dart';
import 'package:workforce_project/view/agent/screen_availablemanagers.dart';
import 'package:workforce_project/view/agent/screen_availableworkers.dart';
import 'package:workforce_project/view/police/screen_changepassword.dart';
import 'package:workforce_project/view/police/screen_closedcomplaints.dart';
import 'package:workforce_project/view/police/screen_managers.dart';
import 'package:workforce_project/view/agent/screen_messages.dart';
import 'package:workforce_project/view/police/screen_notification.dart';
import 'package:workforce_project/view/police/screen_ongoinginvestigation.dart';
import 'package:workforce_project/view/police/screen_settings.dart';
import 'package:workforce_project/view/police/screen_updateprofile.dart';
import 'package:workforce_project/view/police/screen_upsa.dart';
import 'package:workforce_project/view/police/screen_readclosedcomplaints.dart';
import 'package:workforce_project/view/police/screen_readnewcomplaints.dart';
import 'package:workforce_project/view/user/screen_login.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/view/user/screen_register.dart';
import 'package:workforce_project/view/user/screen_reportissue.dart';
import 'package:workforce_project/view/user/screen_repotproblems.dart';
import 'package:workforce_project/view/user/screen_selectidentity.dart';
import 'package:workforce_project/view/user/screen_signorlogin.dart';
import 'package:workforce_project/view/user/screen_signup.dart';
import 'package:workforce_project/view/police/screen_workers.dart';
import 'package:workforce_project/view/user/screen_usernotifications.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';
import 'package:workforce_project/viewmodel/provider.dart';
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
            home: ScreenRegister()));
  }
}
