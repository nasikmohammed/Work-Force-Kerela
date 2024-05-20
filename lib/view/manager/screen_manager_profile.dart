import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/manager/screen_manager_update_profile.dart';

class ScreenManagerProfile extends StatelessWidget {
  ScreenManagerProfile({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: manager.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        var managername = snapshot.data!.docs.first['managername'];
        var managerplace = snapshot.data!.docs.first['managerplace'];
        var managerage = snapshot.data!.docs.first['managerage'];
        var manageridnumber = snapshot.data!.docs.first['manageridnumber'];
        var managerid = snapshot.data!.docs.first['managerid'];
        var manageremail = snapshot.data!.docs.first['manageremail'];
        var managerpassword = snapshot.data!.docs.first['managerpassword'];
        var managerphoto = snapshot.data!.docs.first['managerimage'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHomeManager();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Profile",
                style: GoogleFonts.cambay(color: Colors.black),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: managerphoto == ""
                      ? const Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          size: 60,
                        )
                      : CircleAvatar(
                          radius: 60,
                          // height: 130,
                          child: Image.network(
                            managerphoto,
                          ),
                        )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 207, 203, 203),
                  elevation: 2,
                ),
                child: Text(
                  "Update Profile",
                  style: GoogleFonts.exo2(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenManagerUpdateProfile();
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
                              managername,
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
                            Text(managerplace),
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
                            Text(managerage),
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
                            Text(manageridnumber),
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
                            Text(manageremail),
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
                            Text(managerid),
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
                            Text(managerpassword),
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
