import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenUpdateAgentProfile extends StatefulWidget {
  ScreenUpdateAgentProfile({super.key});

  @override
  State<ScreenUpdateAgentProfile> createState() =>
      _ScreenUpdateAgentProfileState();
}

class _ScreenUpdateAgentProfileState extends State<ScreenUpdateAgentProfile> {
  AgenteService agentstore = AgenteService();

  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    return StreamBuilder(
      stream: agent.snapshots(),
      builder: (context, snapshot) {
        var agentfirstname = snapshot.data!.docs.first['agencyname'];
        var agentaddress = snapshot.data!.docs.first['agentaddress'];
        var agentcity = snapshot.data!.docs.first['agentcity'];
        var agentcontactnumber = snapshot.data!.docs.first['contactnumber'];
        var agentstate = snapshot.data!.docs.first['agentstate'];

        var agentemail = snapshot.data!.docs.first['agentemail'];
        var agentrgpassword = snapshot.data!.docs.first['password'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
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
          body: StreamBuilder(
            stream: agent.snapshots(), 
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(workprovider.mc),
                    ),
                    Text(
                      agentfirstname,
                      style: GoogleFonts.hind(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        width: 700,
                        height: 700,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 246, 244, 244),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Agency Name",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdatename,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Address",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdateaddress,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Contact Number",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller:
                                        funprovider.agentupdatecontactnumber,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "State",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdatestate,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "City",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdatecity,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Email ID",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdateemail,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Password",
                                    style: GoogleFonts.hind(fontSize: 17),
                                  ),
                                  TextFormField(
                                    controller: funprovider.agentupdatepassword,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  workprovider.isselected
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 110),
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 57, 73, 163),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () {},
                                              child: Text(
                                                "Update",
                                                style: GoogleFonts.amaranth(
                                                    color: Colors.white),
                                              )),
                                        )
                                      : const SizedBox()
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
