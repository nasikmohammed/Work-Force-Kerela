import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:provider/provider.dart';
import 'package:workforce_project/model/workersmodel.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';
import 'package:workforce_project/viewmodel/workers_store.dart';

class ScreenAddWorker extends StatefulWidget {
  const ScreenAddWorker({super.key});

  @override
  State<ScreenAddWorker> createState() => _ScreenAddWorkerState();
}

class _ScreenAddWorkerState extends State<ScreenAddWorker> {
  @override
  Widget build(BuildContext context) {
    WorkersStore workersobj = WorkersStore();
    final funprovider = Provider.of<FunProvider>(context);
    final workprovider = Provider.of<WorkProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return ScreenHomeAgent();
                  },
                ));
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: Text(
            "Add Workers",
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.error))]),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
        child: SingleChildScrollView(
          child: Form(
            key: funprovider.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: funprovider.workername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Worker Name";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Place",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: funprovider.workerplace,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Worker Place";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Age",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: funprovider.workerage,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter worker age";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "ID Number",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: funprovider.workeridnumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your ID number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " Email",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: funprovider.workeremail,
                  validator: (value) {
                    if (funprovider.emailregexp
                        .hasMatch(funprovider.workeremail.text)) {
                      return null;
                    } else {
                      return "Please enter valid Email";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Type",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: funprovider.selectedProductType,
                  onChanged: (value) {
                    setState(() {
                      funprovider.selectedProductType = value!;
                    });
                  },
                  items: [
                    'Carpenter',
                    'Electrician',
                    'Construction',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: HexColor("7A5600"),
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    fillColor: HexColor("F2DFB2"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Select Product Type',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: funprovider.workerpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Password";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          funprovider.pickimagefromgallery();
                        },
                        child: Text(
                          "Add Image",
                          style: GoogleFonts.manrope(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 13, 42, 91)),
                      onPressed: () {
                        if (funprovider.formkey.currentState!.validate()) {
                          funprovider.signupwith(context).then(
                            (value) {
                              funprovider.sendEmail(
                                  funprovider.workername.text,
                                  ('Work force kerela Login Password is:${funprovider.workerpassword.text}'),
                                  funprovider.workeremail.text);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ScreenHomeAgent();
                                },
                              ));
                            },
                          );
                        }
                      },
                      child: Text(
                        " Update",
                        style: GoogleFonts.manrope(),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
