import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workforce_project/model/projectmodel.dart';
import 'package:workforce_project/view/manager/screen_employee_details.dart';
import 'package:workforce_project/view/manager/screen_yourproject.dart';

class ScreenProjectDetails extends StatelessWidget {
  ScreenProjectDetails({required this.projectDetailsModel});
  final ProjectDetailsModel projectDetailsModel;
  final CollectionReference project =
      FirebaseFirestore.instance.collection("PROJECT");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: project.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        var projectname = snapshot.data!.docs.first['agentaddprojectname'];
        var projectplace = snapshot.data!.docs.first['agentaddplace'];
        var projectenddate = snapshot.data!.docs.first['agentaddenddate'];
        var projectstartdate = snapshot.data!.docs.first['agentaddstartdate'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenYourProjects();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.black,
                )),
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(
                  width: 150,
                  height: 300,
                  child: projectDetailsModel.projectimage == ""
                      ? const Icon(
                          CupertinoIcons.house_fill,
                          size: 150,
                        )
                      : SizedBox(
                          height: 200,
                          child: Image.network(
                            projectDetailsModel.projectimage!,
                          ),
                        )),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Project Details",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  )),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
              Text(
                projectDetailsModel.agentaddprojectname!,
                style: GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
              ),
              Text(
                projectDetailsModel.agentaddplace!,
                style: GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(${projectDetailsModel.agentaddstartdate})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "to",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "(${projectDetailsModel.agentaddenddate})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Project Manager :",
                style: GoogleFonts.overpass(fontSize: 18, color: Colors.blue),
              ),
              Text(
                projectDetailsModel.agentaddmanager!,
                style: GoogleFonts.amarante(fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
