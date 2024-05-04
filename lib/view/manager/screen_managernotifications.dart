import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenManagerNotifications extends StatelessWidget {
  ScreenManagerNotifications({super.key});
  final CollectionReference workers =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: workers.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final DocumentSnapshot managersnap =
                                snapshot.data!.docs[index];
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(workprovider.person)),
                              title: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    Text(
                                      managersnap["managername"],
                                      style: GoogleFonts.amaranth(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "(Manager)",
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    Text(
                                      "has registered an employee",
                                      maxLines: 2,
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.black, fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Text(
                                  "10 minutes ago",
                                  style: GoogleFonts.quicksand(fontSize: 10),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
