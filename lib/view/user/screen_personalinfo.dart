import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/workersmodel.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/view/user/updatepersonalinfo.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/user_store.dart';

class ScreenUserPersonalInfo extends StatefulWidget {
  ScreenUserPersonalInfo();

  @override
  State<ScreenUserPersonalInfo> createState() => _ScreenUserPersonalInfoState();
}

class _ScreenUserPersonalInfoState extends State<ScreenUserPersonalInfo> {
  FirestoreService firestore = FirestoreService();
  final user = FirebaseFirestore.instance
      .collection("WORKERS")
      .doc(FirebaseAuth.instance.currentUser!.uid);
  WorkersModel workersModel = WorkersModel();

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);

    //      DocumentSnapshot ds=snapshot.data!.docs[id];

    return FutureBuilder(
      future: funprovider.fetchCurrentUserData(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: funprovider.workimage.toString() == ""
                      ? const Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          size: 60,
                        )
                      : CircleAvatar(
                          radius: 60,
                          // height: 130,
                          child: Image.network(funprovider.imageurl!),
                        )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  width: 400,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Name",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              funprovider.workname!,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Place",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workplace!),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              " Age",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workage!),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "ID Number",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workidnumber!),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Email",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workemail!),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              " ID",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workid!),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Password",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(funprovider.workpassword!),
                            const SizedBox(
                              height: 15,
                            ),
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
