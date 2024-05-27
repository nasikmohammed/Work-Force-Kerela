import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/agentmodel.dart';
import 'package:workforce_project/view/police/screen_Agencies_details.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenAgencies extends StatelessWidget {
  const ScreenAgencies({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference agent =
        FirebaseFirestore.instance.collection("AGENT");
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenCompamw();
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
          "Agencies",
          style: GoogleFonts.eduNswActFoundation(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<AgentModel>>(
        stream: funprovider.GetAgentDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            print(snapshot.error);
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Agencies"),
            );
          }
          final agencyDetais = snapshot.data!;

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final agentdata = agencyDetais[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 70,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(agentdata.image!),
                    ),
                    title: Text(
                      agentdata.agencyname!,
                      style: GoogleFonts.eduNswActFoundation(),
                    ),
                    trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return ScreenAgenciesDetails(
                                agentModel: agentdata,
                              );
                            },
                          ));
                        },
                        child: Text("View Profile")),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
