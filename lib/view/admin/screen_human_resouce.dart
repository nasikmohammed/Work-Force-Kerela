import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenHumanResouceManagement extends StatelessWidget {
  const ScreenHumanResouceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Row(
        children: [
          workprovider.admindrawer(),
          Container(
            width: 936,
            height: 800,
            color: Color.fromARGB(255, 68, 71, 86),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Managers",
                      style: GoogleFonts.amaranth(fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(workprovider.kanew),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "ravichander123@gmail.com",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor:
                                        Color.fromARGB(255, 17, 58, 19)),
                                onPressed: () {},
                                child: Text(
                                  "Remove",
                                  style: GoogleFonts.amaranth(),
                                )),
                          ),
                        );
                      },
                    )),
                    Text(
                      "Workers",
                      style: GoogleFonts.amaranth(fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(workprovider.kanew),
                            ),
                            title: Text(
                              "ravichander123@gmail.com",
                              style: GoogleFonts.amaranth(
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor:
                                        Color.fromARGB(255, 17, 58, 19)),
                                onPressed: () {},
                                child: Text(
                                  "Remove",
                                  style: GoogleFonts.amaranth(),
                                )),
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
