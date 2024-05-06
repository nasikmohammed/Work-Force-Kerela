import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_repotproblems.dart';
import 'package:workforce_project/view/user/updatepersonalinfo.dart';
import 'package:workforce_project/viewmodel/user_store.dart';

import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

import '../../model/usermodel.dart';

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
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    return StreamBuilder(
      stream: user.snapshots(),
      builder: (context, snapshot) {
        var workersname = snapshot.data!.docs.first['workersname'];
        var workersplace = snapshot.data!.docs.first['workersplace'];
        var workersage = snapshot.data!.docs.first['workersage'];
        var workersidnumber = snapshot.data!.docs.first['workersidnumber'];
        var workersid = snapshot.data!.docs.first['workersid'];

        var workersemail = snapshot.data!.docs.first['workersemail'];
        var workerspassword = snapshot.data!.docs.first['workerspassword'];
        if (snapshot.hasData) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 247, 255, 222),
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return ScreenReportProblems();
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
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.error,
                          color: Colors.black,
                        ))
                  ]),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(workprovider.person),
                    ),
                    Text(
                      workersname,
                      style: GoogleFonts.nunitoSans(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 330),
                      child: IconButton(
                          onPressed: () {
                            log("userid  ===================================${FirebaseAuth.instance.currentUser!.uid}=========");

                            print(
                                'userid  ===================================${FirebaseAuth.instance.currentUser!.uid}========================================');
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return ScreenUpdatePersonalInfo();
                              },
                            ));
                          },
                          icon: Icon(Icons.swipe_up_rounded)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        width: 400,
                        height: 600,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 244, 244),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(blurRadius: 1)]),
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
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: funprovider.usernamepcontroller,
                                    decoration: InputDecoration(
                                        hintText: workersname,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Place",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller:
                                        funprovider.useraddresscontroller,
                                    decoration: InputDecoration(
                                        hintText: workersplace,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    " Age",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller:
                                        funprovider.usercontactnumbercontroller,
                                    decoration: InputDecoration(
                                        hintText: workersage,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ID Number",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller:
                                        funprovider.userserstatecontroller,
                                    decoration: InputDecoration(
                                        hintText: workersemail,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Email",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: funprovider.usercitycontroller,
                                    decoration: InputDecoration(
                                        hintText: workersemail,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    " ID",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: funprovider.useremailcontroller,
                                    decoration: InputDecoration(
                                        hintText: workersid,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Password",
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller:
                                        funprovider.userpasswordcontroller,
                                    decoration: InputDecoration(
                                        hintText: workerspassword,
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()),
                                  ),
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
              ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
