import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Create Your Account",
            style: GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, right: 30, top: 30),
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
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, right: 30, top: 30),
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
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  hintText: "Password",
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
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
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
                  backgroundColor: const Color.fromARGB(255, 243, 148, 238),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text(
                "Sign in with google",
                style: GoogleFonts.amaranth(color: Colors.black),
              )),
          Row(
            children: [
              const SizedBox(
                width: 90,
              ),
              Text(
                "Already have an account?",
                style: GoogleFonts.amaranth(),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log in",
                    style: GoogleFonts.amaranth(),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
