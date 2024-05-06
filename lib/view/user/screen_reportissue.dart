import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/user_report_model.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/user_report_service.dart';

class ScreenReportIssue extends StatelessWidget {
  const ScreenReportIssue({super.key});

  @override
  Widget build(BuildContext context) {
    UserReportService userReportServicer = UserReportService();
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        elevation: 0,
        title: Text(
          "Report yor problems",
          style: GoogleFonts.merriweather(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                  controller: funprovider.reportproblemcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(50),
                      hintText:
                          "Briefly describe your problem in your work place ...",
                      hintMaxLines: 2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  userReportServicer.addUserreports(
                      UserReportsModel(
                          reportuserissues:
                              funprovider.reportproblemcontroller.text),
                      FirebaseAuth.instance.currentUser!.uid);
                },
                child: Text(
                  "Report the issue",
                  style: GoogleFonts.amaranth(color: Colors.black),
                ))
          ],
        ),
      )),
    );
  }
}
