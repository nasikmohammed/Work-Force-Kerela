import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenUserLogin extends StatelessWidget {
  const ScreenUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(workprovider.loginphoto),
                Text(
                  "Login To Your Account",
                  style: GoogleFonts.sarabun(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: funprovider.workerlogemai,
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: GoogleFonts.sarabun(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: funprovider.workerlogpassword,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.sarabun(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("object");
                      funprovider.signin(context);
                      print("bgbggggggggggggg");
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
