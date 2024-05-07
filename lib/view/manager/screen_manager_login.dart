import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';

import '../../viewmodel/ui_work_provider.dart';

class ScreenManagerLogin extends StatelessWidget {
  const ScreenManagerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
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
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.sarabun(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color.fromARGB(255, 242, 253, 188)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return ScreenHomeManager();
                        },
                      ));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.anekDevanagari(color: Colors.black),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
