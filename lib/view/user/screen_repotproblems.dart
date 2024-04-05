import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_reportissue.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenReportProblems extends StatelessWidget {
  const ScreenReportProblems({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: 500,
              height: 900,
              child: Image.asset(
                workprovider.construction2,
                fit: BoxFit.fitHeight,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 70, top: 710),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenReportIssue();
                    },
                  ));
                },
                child: SizedBox(
                  width: 210,
                  child: Row(
                    children: [
                      Text(
                        "Report you problems",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}