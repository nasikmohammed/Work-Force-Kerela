import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_updateprofileagent.dart';
import 'package:workforce_project/viewmodel/agentfirestore.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("image picker clicked");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            width: 160,
                            height: 100,
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Place Your image",
                                    style: GoogleFonts.kanit(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                            controller: funprovider.agentrgfirstname,
                            decoration: InputDecoration(
                                hintText: "  First Name",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrglastname,
                            decoration: InputDecoration(
                                hintText: "  Last Name",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgcountry,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )),
                                hintText: "  Country",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgaddress,
                            decoration: InputDecoration(
                                hintText: "  Address",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgcity,
                            decoration: InputDecoration(
                                hintText: "  City",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgemail,
                            decoration: InputDecoration(
                                hintText: "  E-Mail",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgaadhaarnumber,
                            decoration: InputDecoration(
                                hintText: "  Adhaar Number",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgmartialstatus,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )),
                                hintText: "  Material Status",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Color.fromARGB(255, 45, 44, 44),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: funprovider.agentrgpassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )),
                                hintText: "Password",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
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
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    setState(() {
                                      islosding = true;
                                    });
                                    agentobbj.addUser(
                                        AgentModel(
                                          agentfirstname:
                                              funprovider.agentrgfirstname.text,
                                          agentlastname:
                                              funprovider.agentrglastname.text,
                                          agentcountry:
                                              funprovider.agentrgcountry.text,
                                          agentaddress:
                                              funprovider.agentrgaddress.text,
                                          agentcity:
                                              funprovider.agentrgcity.text,
                                          agentemail:
                                              funprovider.agentrgemail.text,
                                          aadharnumber: funprovider
                                              .agentrgaadhaarnumber.text,
                                          martial: funprovider
                                              .agentrgmartialstatus.text,
                                          password:
                                              funprovider.agentrgpassword.text,
                                        ),
                                      

                                        //  FirebaseAuth.instance.currentUser!.uid
                                        );
                                    // setState(() {
                                    //islosding = false;
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) {
                                        return ScreenUpdateProfileAgent();
                                      },
                                    ));
                                    // });
                                  },
                                  child: Text(
                                    "Register Now",
                                    style: GoogleFonts.amaranth(
                                        color: Colors.black),
                                  )),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
