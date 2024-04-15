import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_agentregister.dart';
import 'package:workforce_project/view/agent/screen_upsaagent.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/view/user/screen_login.dart';
import 'package:workforce_project/view/user/screen_signup.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenSignOrLogin extends StatelessWidget {
  const ScreenSignOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
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
            padding: const EdgeInsets.only(top: 300, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      "User",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 148, 238),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenAgentRegister();
                        },
                      ));
                    },
                    child: Text(
                      "Agent",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 115, 209, 230),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenHomeManager();
                        },
                      ));
                    },
                    child: Text(
                      "Manager",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 222, 243, 108),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenCompamw();
                        },
                      ));
                    },
                    child: Text(
                      "Police",
                      style: GoogleFonts.amaranth(color: Colors.black),
                    )),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 800),
            child: Text(
              "Indroducing Work Force Kerela:Your Unltimate Employee Registration Solution",
              style: GoogleFonts.amaranth(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
