import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/view/user/screen_selectidentity.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenUserProfile extends StatelessWidget {
  const ScreenUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 197, 123),
        elevation: 0,
        title: Text(
          "Your Profile",
          style: GoogleFonts.amaranth(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 197, 123),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      workprovider.kanew,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sandeep K",
                  style: GoogleFonts.outfit(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenUserPersonalInfo();
                        },
                      ));
                    },
                    icon: const Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                    ),
                    label: SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Text(
                            "Personal",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ScreenSelectIdentity(),
                      ));
                    },
                    icon: const Icon(
                      Icons.perm_identity,
                      color: Colors.black,
                    ),
                    label: SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Text(
                            "Identity",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      workprovider.selectAvailable();
                      workprovider.workassigndropdown(context);
                    },
                    icon: const Icon(
                      Icons.gps_fixed_outlined,
                      color: Colors.black,
                    ),
                    label: SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Text(
                            "Department",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          workprovider.isselected
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.arrow_right,
                                  color: Colors.black,
                                )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            "You can update your profile at any time",
            style: GoogleFonts.openSans(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
