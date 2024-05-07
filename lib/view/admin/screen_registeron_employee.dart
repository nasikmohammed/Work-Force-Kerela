import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:workforce_project/view/agent/screen_agent_profile.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

import '../../model/agentmodel.dart';

class ScreenRegisterAnEmployee extends StatefulWidget {
  ScreenRegisterAnEmployee({super.key});

  @override
  State<ScreenRegisterAnEmployee> createState() =>
      _ScreenRegisterAnEmployeeState();
}

class _ScreenRegisterAnEmployeeState extends State<ScreenRegisterAnEmployee> {
  bool islosding = false;

  @override
  Widget build(BuildContext context) {
    File? images;
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    AgenteService agentobbj = AgenteService();
    return Scaffold(
        body: Row(
      children: [
        workprovider.admindrawer(context),
        Container(
          width: 936,
          height: 800,
          color: const Color.fromARGB(255, 45, 44, 44),
          child: Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        //   funprovider.imageP();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        width: 160,
                        height: 100,
                        child:

                            /// funprovider.images != null
                            ///  ? Image.file(funprovider.images!)
                            /// :
                            Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Place Your image",
                                style: GoogleFonts.kanit(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.add_box)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agencyname,
                        decoration: InputDecoration(
                            hintText: "Agency Name",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentrgaddress,
                        decoration: InputDecoration(
                            hintText: "Address",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentcontactnumber,
                        decoration: InputDecoration(
                            hintText: "  Contact Number",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentrgstate,
                        decoration: InputDecoration(
                            hintText: "  State",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentrgcity,
                        decoration: InputDecoration(
                            hintText: "City",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentrgemail,
                        decoration: InputDecoration(
                            hintText: "Email",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 45, 44, 44),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: funprovider.agentrgpassword,
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(5),
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: 130,
                      child:
                          // islosding
                          // ? Center(
                          //     child: CircularProgressIndicator(),
                          //   )
                          // :
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.blue[400],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                setState(() {
                                  islosding = true;
                                });
                                agentobbj.addUser(
                                  AgentModel(
                                    agencyname: funprovider.agencyname.text,
                                    contactnumber:
                                        funprovider.agentcontactnumber.text,
                                    agentaddress:
                                        funprovider.agentrgaddress.text,
                                    agentcity: funprovider.agentrgcity.text,
                                    agentemail: funprovider.agentrgemail.text,
                                    agentstate: funprovider.agentrgstate.text,
                                    password: funprovider.agentrgpassword.text,
                                  ),

                                  //  FirebaseAuth.instance.currentUser!.uid
                                );
                                // setState(() {
                                //islosding = false;
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenAgentProfile();
                                  },
                                ));
                                // });
                              },
                              child: Text(
                                "Register Now",
                                style:
                                    GoogleFonts.amaranth(color: Colors.black),
                              )),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    ));
  }
}
