import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:workforce_project/view/admin/screen_admin_profile.dart';
import 'package:workforce_project/view/admin/screen_feedback_reports.dart';
import 'package:workforce_project/view/admin/screen_human_resouce.dart';
import 'package:workforce_project/view/admin/screen_notifications.dart';
import 'package:workforce_project/view/admin/screen_registeron_employee.dart';
import 'package:workforce_project/view/admin/screen_verifications.dart';
import 'package:workforce_project/view/agent/screen_aboutusagent.dart';
import 'package:workforce_project/view/agent/screen_add_manager.dart';
import 'package:workforce_project/view/agent/screen_add_project.dart';
import 'package:workforce_project/view/agent/screen_add_workers.dart';
import 'package:workforce_project/view/agent/screen_agent_profile.dart';
import 'package:workforce_project/view/agent/screen_availablemanagers.dart';
import 'package:workforce_project/view/agent/screen_notificationagent.dart';
import 'package:workforce_project/view/manager/screen_availableworkers.dart';
import 'package:workforce_project/view/agent/screen_ongoingprojectagent.dart';
import 'package:workforce_project/view/manager/screen_manager_aboutus.dart';
import 'package:workforce_project/view/manager/screen_manager_profile.dart';
import 'package:workforce_project/view/manager/screen_managernotifications.dart';
import 'package:workforce_project/view/police/screen_aboutus.dart';
import 'package:workforce_project/view/police/screen_alert.dart';
import 'package:workforce_project/view/police/screen_notification.dart';
import 'package:workforce_project/view/police/screen_upsa.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/view/user/Screen_Notifications.dart';
import 'package:workforce_project/view/user/screen_reportissue.dart';
import 'package:workforce_project/view/user/screen_selectidentity.dart';
import 'package:workforce_project/view/user/Screen_Report_list.dart';
import 'package:workforce_project/view/user/screen_user_loginupadate.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

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
  String debruyne = "assets/debruyne.jpg";
  String handshake = "assets/handshake.jpeg";
  String homemanager = "assets/homemanager.jpeg";
  String loginphoto = "assets/loginphoto.jpeg";
  List flats = <String>[
    "assets/flat4.jpeg",
    "assets/flat3.jpeg",
    "assets/flat2.jpeg",
    "assets/flat1.jpeg",
  ];

  List complaints = [
    "New Complaints",
    "Closed Complaints",
    "Ongoing investigations"
  ];
  String selectedoption = "Carpenter";
  String selectedmanager = "salu";

  List department = ["Carpenter", "Electrician", "Construction"];
  List manager = ["salu", "sinu", "sachu"];
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

  dropdownmanager(context) {
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
                value: selectedmanager,
                items: manager.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  selectedmanager = value!;
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

  Widget admindrawer(context) {
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenAdminProfile(),
                        ));
                  },
                  child: Text(
                    "Update profile",
                    style: GoogleFonts.outfit(color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenRegisteronEmployee(),
                      ));
                },
                child: Text(
                  "Register an employee",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenAdminVerification(),
                      ));
                },
                child: Text(
                  "Verifications",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenFeedbackReports(),
                      ));
                },
                child: Text(
                  "Feedbacks and reports ",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenHumanResouceManagement(),
                      ));
                },
                child: Text(
                  "Human Resouse Management",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenAdminNotifications()));
                },
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
  agentdrawer(context) {
    final funprovider = Provider.of<FunProvider>(context);
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      backgroundColor: Color.fromARGB(255, 9, 17, 61),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 3, top: 60),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenAgentProfile(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenAgentAddProject(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Add Projects",
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenAgentAvailableManagers(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Managers",
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenOngoingProjectAgent(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenNotificationAgent();
                    },
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
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
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenAddWorker()))
                      .then(
                    (value) {
                      funprovider.clearAddworkersField();
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Add Workers",
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenAddManager(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Add managers",
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenAgentAboutUs(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "About",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 45,
          ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 50,
          //     ),
          //     const Icon(
          //       Icons.arrow_right,
          //       color: Colors.white,
          //     ),
          //     TextButton(
          //         onPressed: () {},
          //         child: Text(
          //           "Logout",
          //           style:
          //               GoogleFonts.corben(color: Colors.white, fontSize: 12),
          //         ))
          //   ],
          // )
        ],
      ),
    );
  }

//police

  policehomedrawer(context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 3, top: 50),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenUpdtPswdSttngAbt()));
                },
                child: Row(
                  children: [
                    const Icon(
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenNotifications()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Notification",
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ScreenAlert()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Alert",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
        ]));
  }

  int intexnumber = 0;
  managerdrawer(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 400, top: 50, right: 150),
      child: Drawer(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 25, bottom: 3, top: 90),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenManagerProfile()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Profile",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenAgentAvailableWorkers()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Work Assign",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScreenManagernotifications(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Notifications",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenManagerAboutUs()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "About ",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  } /////////////////////////////////////

//USER DRAWER

  userdrawer(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 300, top: 60, left: 10),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Color.fromARGB(255, 9, 17, 61),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 3, top: 60),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenUserPersonalInfo(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenSelectIdentity(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Identity",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenUserReportList(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Notification",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenReportIssue(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        " Reports",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenAboutUs(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "About ",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return ScreenUserLogin();
                        },
                      ));
                    },
                    child: Text(
                      "Logout",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
