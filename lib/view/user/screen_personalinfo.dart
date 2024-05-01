import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/updatepersonalinfo.dart';
import 'package:workforce_project/viewmodel/userfirestore.dart';

import 'package:workforce_project/viewmodel/funprovider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

import '../../model/usermodel.dart';

class ScreenUserPersonalInfo extends StatefulWidget {
  ScreenUserPersonalInfo({super.key});

  @override
  State<ScreenUserPersonalInfo> createState() => _ScreenUserPersonalInfoState();
}

class _ScreenUserPersonalInfoState extends State<ScreenUserPersonalInfo> {
  FirestoreService firestore = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    return FutureBuilder(
      future: firestore.getSingleUserData(
          context, FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 247, 255, 222),
            appBar: AppBar(
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
                    funprovider.usermodelobj.firstname ?? "SANDEEP",
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
                                      hintText:
                                          firestore.singleuserData!.firstname,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Address",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: funprovider.useraddresscontroller,
                                  decoration: InputDecoration(
                                      hintText:
                                          funprovider.usermodelobj.address,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Contact Number",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller:
                                      funprovider.usercontactnumbercontroller,
                                  decoration: InputDecoration(
                                      hintText: funprovider
                                          .usermodelobj.contactnumber,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "State",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller:
                                      funprovider.userserstatecontroller,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "City",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: funprovider.usercitycontroller,
                                  decoration: InputDecoration(
                                      hintText: funprovider.usermodelobj.city,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Email ID",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: funprovider.useremailcontroller,
                                  decoration: InputDecoration(
                                      hintText: funprovider.usermodelobj.email,
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
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Website",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller:
                                      funprovider.userpasswordcontroller,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Company Logo",
                                  style: GoogleFonts.ubuntu(fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller:
                                      funprovider.usercompanylogocontroller,
                                  decoration: const InputDecoration(
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
      },
    );
  }
}
