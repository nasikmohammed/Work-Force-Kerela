import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

import '../../viewmodel/function_provider.dart';
import '../../viewmodel/user_store.dart';

class ScreenUpdatePersonalInfo extends StatefulWidget {
  ScreenUpdatePersonalInfo({super.key});

  @override
  State<ScreenUpdatePersonalInfo> createState() =>
      _ScreenUpdatePersonalInfoState();
}

class _ScreenUpdatePersonalInfoState extends State<ScreenUpdatePersonalInfo> {
  FirestoreService firestore = FirestoreService();

  TextEditingController _namecontroller = TextEditingController();

  final DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
      .instance
      .collection("WORKERS")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  update() {
    final DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
        .instance
        .collection("WORKERS")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    user.update({
      "workersname": _namecontroller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    return StreamBuilder(
      stream: user.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 247, 255, 222),
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return ScreenUserPersonalInfo();
                          },
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.black,
                      )),
                  backgroundColor: const Color.fromARGB(255, 247, 255, 222),
                  elevation: 0,
                  title: Text(
                    " Update Profile ",
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
                child: Form(
                  key: funprovider.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(workprovider.adminprofile),
                      ),
                      TextButton(
                          onPressed: () {
                            funprovider.pickimagefromgallery();
                          },
                          child: Text(
                            "Edit Picture",
                            style: GoogleFonts.robotoSlab(),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          width: 400,
                          height: 600,
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
                                      style: GoogleFonts.ubuntu(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _namecontroller,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffix: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.rtt_rounded)),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Place";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Age ",
                                      style: GoogleFonts.ubuntu(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Enter Your Age ";
                                        } else {
                                          return null;
                                        }
                                      },
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your ID number";
                                        } else {
                                          return null;
                                        }
                                      },
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
                                      validator: (value) {
                                        if (funprovider.emailregexp
                                            .hasMatch(value!)) {
                                          return null;
                                        } else {
                                          return "Check your Email";
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ID ",
                                      style: GoogleFonts.ubuntu(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your ID";
                                        } else {
                                          return null;
                                        }
                                      },
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Password";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.indigo),
                          onPressed: () {
                            if (funprovider.formkey.currentState!.validate()) {
                              update();
                              print("navigator done");
                            }
                          },
                          child: Text("Update"))
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
