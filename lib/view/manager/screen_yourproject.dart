import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_project_details.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenYourProjects extends StatelessWidget {
  const ScreenYourProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Your projects",
          style: GoogleFonts.amaranth(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.question_mark_outlined,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  height: 190,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: 150,
                              child: Image.asset(workprovider.house)),
                          Row(
                            children: [
                              Text(
                                "Bridge",
                                style: GoogleFonts.mukta(),
                              ),
                              Text(
                                "(Angadipuram)",
                                style: GoogleFonts.mukta(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              "This project in progress",
                              style: GoogleFonts.mukta(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Deadlock-01/02/2025",
                                  style: GoogleFonts.mukta(),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.keyboard_control))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.indigo),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenProjectDetails(),
                                    ));
                                  },
                                  child: Text(
                                    "View Details",
                                    style: GoogleFonts.mukta(),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
