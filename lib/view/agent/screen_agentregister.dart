import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenAgentRegister extends StatelessWidget {
  const ScreenAgentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 225, 204),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 50),
          child: Icon(
            Icons.camera,
            color: Color.fromARGB(255, 165, 196, 162),
            size: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 40),
                  child: Text(
                    "Register Now as an Agent",
                    style: GoogleFonts.permanentMarker(fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Agency Name"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Address"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Company Name"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Contact Number"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("State"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("City"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Email-ID"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Password"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Confirm Password"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Website"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Text("Company Logo"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                        ),
                        onPressed: () {},
                        child: Text("Register",
                            style: GoogleFonts.amaranth(
                              color: Colors.white,
                            ))))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
