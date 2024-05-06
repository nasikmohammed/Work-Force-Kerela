import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/manager_report_model.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/manager_report_service.dart';

class ScreenManagerReportProblems extends StatelessWidget {
  const ScreenManagerReportProblems({super.key});

  @override
  Widget build(BuildContext context) {
    ManagerReportService managerReportServicer = ManagerReportService();
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Report yor problems",
          style: GoogleFonts.merriweather(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                  controller: funprovider.managerreportproblemcontroller,
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
                    backgroundColor: Colors.amber[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  managerReportServicer.addManagerreports(
                    ManagerReportModel(
                        reportManagerissues:
                            funprovider.managerreportproblemcontroller.text),
                  );
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
