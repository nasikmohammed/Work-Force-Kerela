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
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.black,
                  )),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
              child: Container(
                width: 450,
                height: 550,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 234, 234),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(children: [
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
                        style: GoogleFonts.amaranth(
                            color: Colors.black, fontSize: 15),
                      )),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 15),
                    child: Text(
                      "The ${projectDetailsModel.agentaddprojectname} Project at  ${projectDetailsModel.agentaddplace} was carried out from  ${projectDetailsModel.agentaddstartdate} to  ${projectDetailsModel.agentaddenddate} under  ${projectDetailsModel.agentaddmanager} With  ${projectDetailsModel.agentaddnoworers} Workers.",
                      style: GoogleFonts.mukta(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
