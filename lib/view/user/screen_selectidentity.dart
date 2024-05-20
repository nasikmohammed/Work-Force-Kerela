import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenSelectIdentity extends StatelessWidget {
  const ScreenSelectIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenUserHome();
                },
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
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
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                funprovider.pickimagefromgallery();
                print("Adhaar picker");
              },
              child: Container(
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
                      width: 20,
                    ),
                    Container(width: 100, height: 100, color: Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                funprovider.pickimagefromgallery();
                print("license picker");
              },
              child: Container(
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                funprovider.pickimagefromgallery();
                print("passport picker");
              },
              child: Container(
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
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      "PASSPORT",
                      style: GoogleFonts.karla(),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
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
