import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenManagerProfile extends StatelessWidget {
  ScreenManagerProfile({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return StreamBuilder(
      stream: manager.snapshots(),
      builder: (context, snapshot) {
        var managername = snapshot.data!.docs.first['managername'];
        var manageraddress = snapshot.data!.docs.first['managername'];
        var managercontactnumber = snapshot.data!.docs.first['managername'];
        var managerstate = snapshot.data!.docs.first['managername'];
        var managercity = snapshot.data!.docs.first['managername'];
        var manageremail = snapshot.data!.docs.first['managername'];
        var managerpassword = snapshot.data!.docs.first['managername'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: workprovider.isselected
                  ? Text(
                      "Update Profile",
                      style: GoogleFonts.nunitoSans(color: Colors.black),
                    )
                  : Text(
                      "Profile",
                      style: GoogleFonts.nunitoSans(color: Colors.black),
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
              CircleAvatar(
                backgroundImage: AssetImage(workprovider.debruyne),
              ),
              Text(
                "Anand Varma",
                style: GoogleFonts.merienda(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 330),
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  width: 400,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 249, 246, 246),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(blurRadius: 1)]),
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
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Address",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Contact Number",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "State",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "City",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email ID",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
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
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Website",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Company Logo",
                              style: GoogleFonts.merienda(fontSize: 17),
                            ),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
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
        );
      },
    );
  }
}
