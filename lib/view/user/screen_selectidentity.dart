import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenSelectIdentity extends StatelessWidget {
  const ScreenSelectIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        title: Text(
          "Select your identity",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Image.asset(workprovider.aadharcard),
                  ),
                  Text(
                    "AADHAR CARD",
                    style: GoogleFonts.karla(),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  RoundCheckBox(
                    size: 15,
                    onTap: (p0) {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(workprovider.drivingLicense),
                  ),
                  Text(
                    "DRIVING LICENSE",
                    style: GoogleFonts.karla(),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  RoundCheckBox(
                    size: 15,
                    onTap: (p0) {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Image.asset(workprovider.passport),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "PASSPORT",
                    style: GoogleFonts.karla(),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  RoundCheckBox(
                    size: 15,
                    onTap: (p0) {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {},
                child: Text(
                  "Done",
                  style: GoogleFonts.karla(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
