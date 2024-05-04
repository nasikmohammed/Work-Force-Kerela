import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_update_agent_profile.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenAgentProfile extends StatelessWidget {
  ScreenAgentProfile({super.key});

  AgenteService agentstore = AgenteService();

  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final workprovider = Provider.of<WorkProvider>(context);

    return StreamBuilder(
      stream: agent.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        var agentfirstname = snapshot.data.docs.first['agencyname'];
        var agentaddress = snapshot.data.docs.first['agentaddress'];
        var agentcity = snapshot.data.docs.first['agentcity'];
        var agentcontactnumber = snapshot.data!.docs.first['contactnumber'];
        var agentstate = snapshot.data.docs.first['agentstate'];

        var agentemail = snapshot.data.docs.first['agentemail'];
        var agentrgpassword = snapshot.data.docs.first['password'];

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
          body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(left: 280),
                  child: TextButton.icon(
                      label:const Text("Update"),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return ScreenUpdateAgentProfile();
                          },
                        ));
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    width: width,
                    height: height,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentfirstname,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentaddress,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentcontactnumber,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentstate,
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
                                decoration: InputDecoration(
                                    hintText: agentcity,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentemail,
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
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: agentrgpassword,
                                    contentPadding: const EdgeInsets.all(5),
                                    border: OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              workprovider.isselected
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 110),
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
          ),
        );
      },
    );
  }
}
