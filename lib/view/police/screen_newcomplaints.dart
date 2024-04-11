import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/police/screen_readnewcomplaints.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenNewComplaints extends StatelessWidget {
  const ScreenNewComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "New Complaints",
          style: GoogleFonts.sourceCodePro(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(workprovider.person),
                  ),
                  title: Text("Suhail Ibraheem", style: GoogleFonts.alata()),
                  subtitle: Text(
                    "Reported a new complaint",
                    style: GoogleFonts.nunitoSans(),
                  ),
                  trailing: SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenReadNewComplaints(),
                          ));
                        },
                        child: Text(
                          "Read",
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
  }
}
