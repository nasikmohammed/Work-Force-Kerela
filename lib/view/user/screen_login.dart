import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_signup.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "",
              style:
                  GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                controller: funprovider.loginusernamecontroller,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Usename",
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
                controller: funprovider.loginpasswordcontroller,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 245, 255, 158),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                 
                 // await funprovider.signin();
                  
                },
                child: Text(
                  "Log in",
                  style: GoogleFonts.amaranth( color: Colors.black),
                )),
            TextButton(
              child: Text(
                "Forgot password?",
                style: GoogleFonts.amaranth(color: Colors.black),
              ),
              onPressed: () {},
            ),
            Row(
              children: [
                const SizedBox(
                  width: 90,
                ),
                Text(
                  "Dont have an account",
                  style: GoogleFonts.amaranth(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenSignup();
                        },
                      ));
                    },
                    child: Text(
                      "sign up",
                      style: GoogleFonts.amaranth(),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
