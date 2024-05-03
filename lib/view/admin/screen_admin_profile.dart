import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenAdminProfile extends StatelessWidget {
  const ScreenAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1600,
            height: 350,
            color: Color.fromARGB(255, 243, 186, 101),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 310),
            child: Container(
              width: 1600,
              height: 500,
              color: Color.fromARGB(255, 73, 72, 72),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 450, top: 50),
            child: Container(
              width: 700,
              height: 620,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(workprovider.adminprofile),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Roshan sharma",
                      style: GoogleFonts.libreFranklin(
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Name", hintStyle: GoogleFonts.hind()),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "E-mail", hintStyle: GoogleFonts.hind()),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Address", hintStyle: GoogleFonts.hind()),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Contact number",
                          hintStyle: GoogleFonts.hind()),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "City",
                          hintStyle: GoogleFonts.hind(),
                          suffix: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ))),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "State",
                          hintStyle: GoogleFonts.hind(),
                          suffix: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ))),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            backgroundColor: Color.fromARGB(255, 33, 44, 111)),
                        onPressed: () {},
                        child: Text(
                          "Update",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
