import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/usermodel.dart';
import 'package:workforce_project/view/user/screen_login.dart';
import 'package:workforce_project/view/user/screen_otp.dart';
import 'package:workforce_project/view/user/screen_repotproblems.dart';
import 'package:workforce_project/view/user/screenbottom.dart';
import 'package:workforce_project/viewmodel/userfirestore.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});

  final firestore = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  funprovider.imagePickforregister();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  width: 160,
                  height: 100,
                  child: Center(
                    child: Form(
                      key: funprovider.formkeyregister,
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
                          const Icon(Icons.add_box)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.firstnamecontroller,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter your firstname";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "First Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.lastnamecontroller,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter your Lastname";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "Last Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.countrycontroller,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            funprovider.countrypicker(context);
                          },
                          icon: Icon(Icons.arrow_drop_down)),
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "Country",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.addresscontroller,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter your Address";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.citycontroller,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter your cityname";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "City",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: TextFormField(
                  validator: (value) {
                    if (funprovider.emailregexp
                        .hasMatch(funprovider.emailcontroller.text)) {
                      return null;
                    } else {
                      return "Invalid email";
                    }
                  },
                  controller: funprovider.emailidcontroller,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "E-Mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  validator: (value) {
                    if (funprovider.aadharpattern
                        .hasMatch(funprovider.emailcontroller.text)) {
                      return null;
                    } else {
                      return "Invalid aadhaar";
                    }
                  },
                  controller: funprovider.aadhaarcontroller,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "Adhaar Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: funprovider.meterialstatuscontroller,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            workprovider.martialdropdown(context);
                          },
                          icon: Icon(Icons.arrow_drop_down)),
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      hintText: "Martial Status",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (funprovider.formkeyregister.currentState!.validate()) {
                      await funprovider.emailotp(context);
                    }
                    UserModel obj = UserModel(
                        firstname: funprovider.firstnamecontroller.text,
                        lastname: funprovider.lastnamecontroller.text,
                        country: funprovider.countrycontroller.text,
                        address: funprovider.addresscontroller.text,
                        city: funprovider.citycontroller.text,
                        email: funprovider.emailidcontroller.text,
                        aadharnumber: funprovider.aadhaarcontroller.text,
                        martialstatus:
                            funprovider.meterialstatuscontroller.text);
                    firestore.addUser(obj);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenOtp(),
                    ));
                  },
                  child: Text(
                    "Register Now",
                    style: GoogleFonts.amaranth(color: Colors.black),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
