// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

class ScreenAgentProfile extends StatelessWidget {
  ScreenAgentProfile({super.key});

  AgenteService agentstore = AgenteService();

  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);

    return StreamBuilder(
      stream: agent.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        var agentfirstname = snapshot.data!.docs.first['agencyname'];
        var agentaddress = snapshot.data!.docs.first['agentaddress'];
        var agentcity = snapshot.data!.docs.first['agentcity'];
        var agentcontactnumber = snapshot.data!.docs.first['contactnumber'];
        var agentstate = snapshot.data!.docs.first['agentstate'];

        var agentemail = snapshot.data!.docs.first['agentemail'];
        var agentrgpassword = snapshot.data!.docs.first['password'];
        var agentphoto = snapshot.data!.docs.first["image"];

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
                style: GoogleFonts.overpass(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.error,
                      color: Colors.black,
                    ))
              ]),
          body: Padding(
            padding: const EdgeInsets.only(left: 100, top: 80),
            child: Column(
              children: [
                SizedBox(
                    width: 150,
                    child: agentphoto == ""
                        ? const Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 100,
                          )
                        : SizedBox(
                            height: 130,
                            child: Image.network(
                              agentphoto,
                            ),
                          )),
                Text(
                  agentfirstname,
                  style: GoogleFonts.hind(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 470,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Agency Name",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                              width: 160,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(agentfirstname),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 227, 220, 219),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 15,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Address",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentaddress),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Contact Number",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentcontactnumber),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "State",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentstate),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "City",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentcity),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email ID",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentemail),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.hind(
                                color: const Color.fromARGB(255, 37, 55, 160),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(agentrgpassword),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
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
