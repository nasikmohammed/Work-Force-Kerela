import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenAgentAvailableWorkers extends StatelessWidget {
  const ScreenAgentAvailableWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 234, 234),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 238, 234, 234),
        title: Text(
          "Work force kerala",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(workprovider.mc),
          ),
          title: Text(
            "MC HOUSE BUILDING",
            style: GoogleFonts.andika(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                height: 30,
                child: OutlinedButton(
                    onPressed: () {
                      workprovider.selectAvailable();
                    },
                    child: Text("Select",
                        style: GoogleFonts.amaranth(
                          color: Colors.black,
                        )))),
            const SizedBox(
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
            const SizedBox(
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
                boxShadow: const [BoxShadow(blurRadius: 2)],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Available Workers",
                  style: GoogleFonts.amaranth(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(workprovider.debruyne),
                        ),
                        title: Text("Sruthi Payal", style: GoogleFonts.alata()),
                        subtitle: Text("Construction worker"),
                        trailing: SizedBox(
                          width: 110,
                          child: Row(children: [
                            SizedBox(
                              height: 30,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 37, 49, 117)),
                                  onPressed: () {
                                    workprovider.workassigndropdown(context);
                                  },
                                  child: Text(
                                    "Assign",
                                    style: GoogleFonts.amaranth(
                                        color: Colors.white),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            workprovider.isselected
                                ? RoundCheckBox(
                                    size: 20,
                                    onTap: (p0) {},
                                  )
                                : const SizedBox()
                          ]),
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
