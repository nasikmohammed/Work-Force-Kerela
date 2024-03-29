import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class WorkProvider extends ChangeNotifier {
  String person = "assets/person.jpeg";
  List complaints = [
    "New Complaints",
    "Closed Complaints",
    "Ongoing investigations"
  ];
  String selectedoption = "Carpenter";
  List department = ["Carpenter", "Electrician", "Construction"];
  bool isselected = false;
  //available workers
  workassigndropdown(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 201, 191, 190),
              child: DropdownButtonFormField(
                value: selectedoption,
                items: department.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  selectedoption = value!;
                },
              ),
            ),
          ),
        );
      },
    );
  }

  selectAvailable() {
    isselected = !isselected;
    notifyListeners();
  }
}
