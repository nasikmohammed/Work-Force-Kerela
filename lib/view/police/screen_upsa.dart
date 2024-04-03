import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenUpdtPswdSttngAbt extends StatelessWidget {
  const ScreenUpdtPswdSttngAbt({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Work force kerela",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(workprovider.person),
            ),
            Text(
              "Police",
              style: GoogleFonts.mukta(),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                print("Update profile");
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Update profile",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("Change password");
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Change password",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("Settings");
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("About us");
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "About us",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
