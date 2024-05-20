
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/view/user/updatepersonalinfo.dart';
import 'package:workforce_project/viewmodel/user_store.dart';



class ScreenUserPersonalInfo extends StatefulWidget {
  ScreenUserPersonalInfo({super.key});

  @override
  State<ScreenUserPersonalInfo> createState() => _ScreenUserPersonalInfoState();
}

class _ScreenUserPersonalInfoState extends State<ScreenUserPersonalInfo> {
  FirestoreService firestore = FirestoreService();
  final CollectionReference user =
      FirebaseFirestore.instance.collection("WORKERS");

  @override
  Widget build(BuildContext context) {
  

    return StreamBuilder(
      stream: user.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var workersname = snapshot.data!.docs.first['workersname'];
          var workersplace = snapshot.data!.docs.first['workersplace'];
          var workersage = snapshot.data!.docs.first['workersage'];
          var workersidnumber = snapshot.data!.docs.first['workersidnumber'];
          var workersid = snapshot.data!.docs.first['workersid'];

          var workersemail = snapshot.data!.docs.first['workersemail'];
          var workerspassword = snapshot.data!.docs.first['workerspassword'];
          var workerimage = snapshot.data!.docs.first['workerimage'];
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 247, 255, 222),
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return ScreenUserHome();
                        },
                      ));
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.black,
                    )),
                backgroundColor: const Color.fromARGB(255, 247, 255, 222),
                elevation: 0,
                title: Text(
                  "Personal information",
                  style: GoogleFonts.overpass(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      workerimage == ""
                          ? Icon(CupertinoIcons.person_alt)
                          : Container(
                              height: 100,
                              child: Image.network(workerimage),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor:
                                Color.fromARGB(255, 242, 239, 239)),
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.bebasNeue(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return ScreenUpdatePersonalInfo();
                            },
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          width: 400,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Name",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersname),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Place",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersplace),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      " Age",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersage),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ID Number",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersidnumber),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Email",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersemail),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      " ID",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workersid),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Password",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(workerspassword),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
