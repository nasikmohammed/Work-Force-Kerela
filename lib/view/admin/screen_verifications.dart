import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/admin/screen_pending_verification.dart';
import 'package:workforce_project/view/admin/screen_verified_registrations.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAdminVerification extends StatelessWidget {
  const ScreenAdminVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          workprovider.admindrawer(context),
          Stack(
            children: [
              Container(
                  width: 936,
                  height: 1000,
                  child: Image.asset(
                    workprovider.adminverifyy,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenPendingVerifications(),
                                ));
                          },
                          child: Text(
                            "Pending verifications",
                            style: GoogleFonts.workSans(
                              fontSize: 20,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenVerifiedRegisstrations(),
                                ));
                          },
                          child: Text(
                            "Verified registrations",
                            style: GoogleFonts.workSans(
                              fontSize: 20,
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
