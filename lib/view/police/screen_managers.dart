import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/police/screen_camw.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenManagers extends StatelessWidget {
  ScreenManagers({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( leading: IconButton(
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
          "Managers",
          style: GoogleFonts.merriweather(
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
        stream: manager.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final DocumentSnapshot managersnap = snapshot.data.docs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(workprovider.debruyne),
                  ),
                  title: Text(managersnap['managername'],
                      style: GoogleFonts.barlow()),
                  trailing: SizedBox(
                    height: 30,
                    width: 105,
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
