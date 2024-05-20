import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/manager_report_model.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenHomeManager();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Report yor problems",
          style: GoogleFonts.overpass(
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
                  managerReportServicer
                      .addManagerreports(ManagerReportModel(
                          reportManagerissues:
                              funprovider.managerreportproblemcontroller.text))
                      .then((value) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHomeManager();
                      },
                    ));
                  });
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
