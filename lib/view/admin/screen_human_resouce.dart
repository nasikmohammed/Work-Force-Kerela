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
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Managers",
                          style: GoogleFonts.amaranth(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                      ],
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
                                  color: Color.fromARGB(255, 153, 153, 153),
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: Text(
                                  "Remove",
                                  style:
                                      GoogleFonts.amaranth(color: Colors.black),
                                )),
                          ),
                        );
                      },
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Workers",
                          style: GoogleFonts.amaranth(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                      ],
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
                                  color: Color.fromARGB(255, 153, 153, 153),
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: Text(
                                  "Remove",
                                  style:
                                      GoogleFonts.amaranth(color: Colors.black),
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
