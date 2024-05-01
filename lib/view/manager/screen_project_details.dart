import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/manager/screen_employee_details.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenProjectDetails extends StatelessWidget {
  ScreenProjectDetails({super.key});
  final CollectionReference project =
      FirebaseFirestore.instance.collection("PROJECT");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return StreamBuilder(
      stream: project.snapshots(),
      builder: (context, snapshot) {
        var projectname = snapshot.data!.docs.first['agentaddprojectname'];
        var projectplace = snapshot.data!.docs.first['agentaddplace'];
        var projectenddate = snapshot.data!.docs.first['agentaddenddate'];
        var projectstartdate = snapshot.data!.docs.first['agentaddstartdate'];
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Project Details",
              style: GoogleFonts.amaranth(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.question_mark,
                    color: Colors.black,
                  ))
            ],
            elevation: 0,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    projectname,
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
                  ),
                  Text(
                    "(${projectplace})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(${projectenddate})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "to",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "(${projectstartdate})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
                    "Employees included in this project",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  )),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(workprovider.debruyne)),
                      title: Text(
                        "John hernandez",
                        style: GoogleFonts.amaranth(color: Colors.black),
                      ),
                      subtitle: Text(
                        "construction worker",
                        style: GoogleFonts.amaranth(fontSize: 10),
                      ),
                      trailing: SizedBox(
                        height: 30,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    Color.fromARGB(255, 21, 41, 153)),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => ScreenEmployeeDetails(),
                              ));
                            },
                            child: Text(
                              "View",
                              style: GoogleFonts.amaranth(color: Colors.white),
                            )),
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
