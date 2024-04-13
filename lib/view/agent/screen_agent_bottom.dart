import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/agent/screen_messages.dart';
import 'package:workforce_project/view/agent/screen_notificationagent.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAgentBottom extends StatefulWidget {
  const ScreenAgentBottom({super.key});

  @override
  State<ScreenAgentBottom> createState() => _ScreenAgentBottomState();
}

class _ScreenAgentBottomState extends State<ScreenAgentBottom> {
  final _pagesagent = [
    ScreenAgentMessages(),
    ScreenHomeAgent(),
    ScreenNotificationAgent()
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
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell), label: "notifications")
          ]),
      body: _pagesagent[workprovider.intexnumber],
    );
  }
}
