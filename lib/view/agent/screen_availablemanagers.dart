import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenAgentAvailableManagers extends StatelessWidget {
  ScreenAgentAvailableManagers({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");
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
      ),
      body: StreamBuilder(
        stream: manager.snapshots(),
        builder: (context,  snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
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
                      boxShadow: const [BoxShadow(blurRadius: 3)],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Available Managers",
                        style: GoogleFonts.concertOne(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            
                            final DocumentSnapshot managersnap =
                                snapshot.data!.docs[index];

                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(workprovider.kanew),
                              ),
                              title: Text(managersnap['managername'],
                                  style: GoogleFonts.alata()),
                              subtitle: Text(
                                "Building Designer",
                                style: GoogleFonts.libreFranklin(),
                              ),
                              trailing: SizedBox(
                                width: 110,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 37, 49, 117)),
                                          onPressed: () {},
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
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data?.docs.length,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
