import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_login.dart';
import 'package:workforce_project/view/user/screen_signup.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenSignOrLogin extends StatelessWidget {
  const ScreenSignOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: 400,
              height: 900,
              child: Image.asset(workprovider.construction4, fit: BoxFit.fill)),
          Positioned(
            left: 70,
            top: 45,
            child: Text(
              "Workforcekerela",
              style: GoogleFonts.amaranth(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenSignup();
                        },
                      ));
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
                Text(
                  "or",
                  style: GoogleFonts.cormorant(),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 148, 238),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenLogin();
                        },
                      ));
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
const SizedBox(
                  height: 300,
                ),
                Text(
                  "Indroducing Work Force Kerela:Your Unltimate Employee Registration Solution",
                  style: GoogleFonts.amaranth(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
