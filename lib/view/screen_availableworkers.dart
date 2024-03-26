import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAvailableWorkers extends StatelessWidget {
  const ScreenAvailableWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Work force kerala",
          style: GoogleFonts.righteous(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sd_card_alert_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(children: [
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.amber),
          title: Text("MC HOUSE BUILDING"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                height: 30,
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Select",
                        style: GoogleFonts.amaranth(
                          color: Colors.black,
                        )))),
            SizedBox(
              width: 10,
            ),
            SizedBox(
                height: 30,
                width: 88,
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text("SelectAll",
                        style: GoogleFonts.amaranth(
                          color: Colors.black,
                        )))),
            SizedBox(
              width: 30,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: 500,
            height: 668,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 3)],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Available Workers",
                  style: GoogleFonts.concertOne(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 0, 100, 17)),
                        title: Text("Sruthi Payal worker",
                            style: GoogleFonts.alata()),
                        trailing: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 37, 49, 117)),
                              onPressed: () {
                                workprovider.workassigndropdown(context);
                              },
                              child: Text(
                                "Assign",
                                style:
                                    GoogleFonts.amaranth(color: Colors.white),
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
