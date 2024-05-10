import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_manager_profile.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenManagerUpdateProfile extends StatelessWidget {
  ScreenManagerUpdateProfile({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return StreamBuilder(
      stream: manager.snapshots(),
      builder: (context, snapshot) {
        var managername = snapshot.data!.docs.first['managername'];
        var managerplace = snapshot.data!.docs.first['managerplace'];
        var managerage = snapshot.data!.docs.first['managerage'];
        var manageridnumber = snapshot.data!.docs.first['manageridnumber'];
        var manageremail = snapshot.data!.docs.first['manageremail'];
        var managereid = snapshot.data!.docs.first['managerid'];
        var managerpassword = snapshot.data!.docs.first['managerpassword'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ScreenManagerProfile();
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
                "Update Profile",
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(workprovider.debruyne),
                ),
                TextButton(
                    onPressed: () {
                      print("Edit Picture");
                    },
                    child: Text(
                      "Edit Picture",
                      style: GoogleFonts.figtree(),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Container(
                    width: 400,
                    height: 650,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: managername,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Place",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: managerplace,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                " Age",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: managerage,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "ID Number",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: manageridnumber,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Email",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: manageremail,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                " ID",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: managereid,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.cambay(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: managerpassword,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: OutlinedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.indigo),
                                    onPressed: () {},
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.yeonSung(
                                          color: Colors.white),
                                    )),
                              ),
                              const SizedBox(
                                height: 60,
                              )
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
