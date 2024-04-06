import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  String adminlogin = "assets/adminlogin.jpeg";
  String adminprofile = "assets/abb.webp";
  String adminverifyy = "assets/cn.jpeg";
  String kanew = "assets/kanew.jpg";

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
  } //adminprofile

  Widget admindrawer() {
    return Container(
      width: 600,
      height: 800,
      color: Color.fromARGB(255, 234, 229, 229),
      child: Padding(
        padding: const EdgeInsets.only(right: 260),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: CircleAvatar(
                  backgroundImage: AssetImage(
                adminprofile,
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Roshan sharma",
              style:
                  GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              width: 130,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 10, backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Update profile",
                    style: GoogleFonts.outfit(color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Register an employee",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Verifications",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Feedbacks and reports ",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Human Resouse Management",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Notifications",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

//agent drawer...
  agentdrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 3, top: 50),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Profile",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Employees in hand",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Managers in hand",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Ongoing projects",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Notifcation",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 9, 17, 61),
    );
  }
}
