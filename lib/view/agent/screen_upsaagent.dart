import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_changepasswordagent.dart';
import 'package:workforce_project/view/agent/screen_settingsagent.dart';
import 'package:workforce_project/view/agent/screen_updateprofileagent.dart';
import 'package:workforce_project/view/police/screen_aboutus.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAgentProfile extends StatelessWidget {
  const ScreenAgentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 225, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 206, 225, 204),
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
              backgroundImage: AssetImage(workprovider.mc),
            ),
            Text(
              "MC HOUSE BUILDING",
              style: GoogleFonts.mukta(),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenUpdateProfileAgent(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 211, 228, 209),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenChangePasswordAgent(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 211, 228, 209),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenSettingsAgent(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 211, 228, 209),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenAboutUs(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 211, 228, 209),
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
