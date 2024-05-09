// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/agent/screen_update_agent_profile.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenAgentProfile extends StatelessWidget {
  ScreenAgentProfile({super.key});

  AgenteService agentstore = AgenteService();

  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);

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
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return const ScreenHomeAgent();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Profile",
                style: GoogleFonts.nunitoSans(color: Colors.black),
              ),
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
                backgroundImage: AssetImage(workprovider.mc),
              ),
              Text(
                agentfirstname,
                style:
                    GoogleFonts.hind(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 247, 245, 245)),
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.karla(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return ScreenUpdateAgentProfile();
                      },
                    ));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: 630,
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
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentfirstname,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Address",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentaddress,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Contact Number",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentcontactnumber,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "State",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentstate,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "City",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentcity,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email ID",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentemail,
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Password",
                              style: GoogleFonts.hind(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: agentrgpassword,
                              readOnly: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                              ),
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
