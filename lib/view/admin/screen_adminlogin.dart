import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/admin/screen_registeron_employee.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAdminLogin extends StatelessWidget {
  const ScreenAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 700),
            child: SizedBox(
              width: width,
              height: height,
              child: Image.asset(workprovider.adminlogin),
            ),
          ),
          Positioned(
            left: 350,
            top: 80,
            child: Text(
              "Welcome back !!",
              style: GoogleFonts.signikaNegative(
                  fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300, top: 330, right: 700),
            child: Column(
              children: [
                Text(
                  "Login as an admin",
                  style: GoogleFonts.signikaNegative(
                      fontWeight: FontWeight.w800, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: funprovider.adminemailcontroller,
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        prefixIcon: const Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: funprovider.adminpasswordcontroller,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Remember me",
                      style: GoogleFonts.sairaCondensed(color: Colors.black),
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      width: 300,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.catamaran(
                              color: Color.fromARGB(255, 219, 46, 34)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 32,
                  width: 100,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 23, 40, 137)),
                      onPressed: () {
                        funprovider.checkadminemail(context);
                      },
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
