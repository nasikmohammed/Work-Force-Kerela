
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool editnameicon = true;
  bool editplaceicon = true;
  bool editageicon = true;
  bool editidnumbericon = true;
  bool editemailicon = true;
  bool editidicon = true;
  bool editpasswordicon = true;

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
                                      initialValue: workersname,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editnameicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editnameicon = false;
                                        });
                                      },
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
                                      initialValue: workersplace,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Place";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editplaceicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editplaceicon = false;
                                        });
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
                                      initialValue: workersage,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Enter Your Age ";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editageicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editageicon = false;
                                        });
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
                                      initialValue: workersidnumber,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your ID number";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editidnumbericon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editidnumbericon = false;
                                        });
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
                                      initialValue: workersemail,
                                      validator: (value) {
                                        if (funprovider.emailregexp
                                            .hasMatch(value!)) {
                                          return null;
                                        } else {
                                          return "Check your Email";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editemailicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editemailicon = false;
                                        });
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
                                      initialValue: workersid,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your ID";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editidicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editidicon = false;
                                        });
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
                                      initialValue: workerspassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Password";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: editpasswordicon
                                            ? Icon(Icons.edit)
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          editpasswordicon = false;
                                        });
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
