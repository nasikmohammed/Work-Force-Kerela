import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class WorkProvider extends ChangeNotifier {
  String person = "assets/person.jpeg";
  String construction1 = "assets/construction1.webp";
  String construction2 = "assets/003e4355-1ff1-40bf-a92d-5c1451df9bc4.jpeg";
  String construction3 = "assets/con3.jpeg";
  String construction4 = "assets/con4.jpg";
  String mc = "assets/MC1.jpg";
  String aadharcard = "assets/Aadhar card.png";
  String drivingLicense = "assets/driver license.png";
  String passport = "assets/passport1.jpeg";
  String house = "assets/house.webp";
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
              color: Colors.white,
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
