import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_repotproblems.dart';
import 'package:workforce_project/view/user/screen_usernotifications.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenBottomNav extends StatefulWidget {
  const ScreenBottomNav({super.key});

  @override
  State<ScreenBottomNav> createState() => _ScreenBottomNavState();
}

class _ScreenBottomNavState extends State<ScreenBottomNav> {
  final _pages = [
    ScreenUserProfile(),
    ScreenReportProblems(),
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
 