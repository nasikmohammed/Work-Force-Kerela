import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/view/user/screen_usernotifications.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenBottomNav extends StatefulWidget {
  const ScreenBottomNav({super.key});

  @override
  State<ScreenBottomNav> createState() => _ScreenBottomNavState();
}

class _ScreenBottomNavState extends State<ScreenBottomNav> {
  final _pages = [
    ScreenUserProfile(),
    ScreenUserHome(),
    ScreenUserNotifications()
  ];
  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: workprovider.intexnumber,
        onTap: (value) {
          setState(() {
            workprovider.intexnumber = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Notifications")
        ],
      ),
      body: _pages[workprovider.intexnumber],
    );
  }
}
 