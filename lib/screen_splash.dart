import 'package:flutter/material.dart';
import 'package:workforce_project/view/admin/screen_adminlogin.dart';
import 'package:workforce_project/view/admin/screen_register_onemployee.dart';
import 'package:workforce_project/view/agent/screen_agent_login.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/manager/screen_manager_login.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/view/police/screen_workers.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/view/user/screen_user_loginupadate.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenAdminLogin(),
                  ));
                },
                child: const Text("Admin")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenAgentLogin(),
                  ));
                },
                child: const Text("Agent")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenManagerLogin(),
                  ));
                },
                child: const Text("Manager")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenUserLogin(),
                  ));
                },
                child: const Text("Workers")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenCompamw(),
                  ));
                },
                child: const Text("Police"))
          ],
        ),
      )),
    );
  }
}
