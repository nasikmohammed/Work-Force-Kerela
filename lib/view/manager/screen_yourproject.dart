import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_home_manager.dart';
import 'package:workforce_project/view/manager/screen_project_details.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenYourProjects extends StatelessWidget {
  ScreenYourProjects({super.key});

  final CollectionReference project =
      FirebaseFirestore.instance.collection("PROJECT");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return StreamBuilder(
      stream: project.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

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
            title: Text(
              "Your projects",
              style: GoogleFonts.amaranth(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var projectname =
                        snapshot.data!.docs[index]['agentaddprojectname'];
                    var projectplace =
                        snapshot.data!.docs[index]['agentaddplace'];
                    var projectdeaddate =
                        snapshot.data!.docs[index]['agentaddenddate'];
                    var projectimages =
                        snapshot.data!.docs[index]['projectimage'];
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
                                  child: projectimages == ""
                                      ? const Icon(
                                          CupertinoIcons.house_fill,
                                          size: 100,
                                        )
                                      : SizedBox(
                                          height: 130,
                                          child: Image.network(
                                            projectimages,
                                          ),
                                        )),
                              Row(
                                children: [
                                  Text(
                                    projectname,
                                    style: GoogleFonts.mukta(),
                                  ),
                                  Text(
                                    "(${projectplace})",
                                    style:
                                        GoogleFonts.mukta(color: Colors.grey),
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
                                      'Deadlock :   ${projectdeaddate}',
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
      },
    );
  }
}
