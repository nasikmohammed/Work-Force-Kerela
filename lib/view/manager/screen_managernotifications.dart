import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenManagerNotifications extends StatelessWidget {
  ScreenManagerNotifications({super.key});
  final CollectionReference workers =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenHomeManager();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: funprovider.getreportmanager(),
        builder: (context, snapshot) {
          final data = funprovider.managermodel;
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
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(workprovider.person)),
                                title: Text(
                                  "Your Complaints ({data[index].reportuserissues.toString()}) is Registered On nearby Police Station ",
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
                            itemCount: 45),
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
