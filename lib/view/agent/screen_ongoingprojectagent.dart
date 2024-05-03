import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenOngoingProjectAgent extends StatelessWidget {
  const ScreenOngoingProjectAgent({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 234, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 234, 234),
        elevation: 0,
        title: Text(
          "Work force kerelaa",
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
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(backgroundImage: AssetImage(workprovider.mc)),
              const SizedBox(
                width: 10,
              ),
              Text(
                "MC HOUSE BUILDING",
                style: GoogleFonts.nunitoSans(
                    fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 2)],
                  color: Color.fromARGB(255, 239, 240, 239),
                  borderRadius: BorderRadius.circular(15)),
              width: 400,
              height: 700,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Ongoing Projects",
                      style: GoogleFonts.alata(
                          fontSize: 19, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(workprovider.mc),
                                  Text(
                                      "Cunstruction work of super market isin progress",
                                      style: GoogleFonts.alata(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
