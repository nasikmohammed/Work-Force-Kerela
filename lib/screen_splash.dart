import 'package:flutter/material.dart';
import 'package:workforce_project/view/admin/screen_adminlogin.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';

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
                child: Text("Admin")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenHomeAgent(),
                  ));
                },
                child: Text("Agent")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenHomeManager(),
                  ));
                },
                child: Text("Manager")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenHomeManager(),
                  ));
                },
                child: Text("Workers")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenUserHome(),
                  ));
                },
                child: Text("Police"))
          ],
        ),
      )),
    );
  }
}
