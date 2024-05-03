import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenWorkers extends StatelessWidget {
  ScreenWorkers({super.key});
  final CollectionReference worker =
      FirebaseFirestore.instance.collection("WORKERS");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Workers",
          style: GoogleFonts.quicksand(
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
      body: StreamBuilder(
        stream: worker.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final DocumentSnapshot workerssnap = snapshot.data.docs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(workprovider.adminprofile),
                  ),
                  title: Text(workerssnap["workersname"],
                      style: GoogleFonts.alata()),
                  trailing: SizedBox(
                    height: 30,
                    width: 103,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text("View Profile",
                            style: GoogleFonts.amaranth(
                              color: Colors.white,
                            ))),
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
