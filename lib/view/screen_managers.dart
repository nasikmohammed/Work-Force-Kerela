import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenManagers extends StatelessWidget {
  const ScreenManagers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              icon: Icon(
                Icons.sd_card_alert_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 240, 178, 178)),
            title: Text("John hernandez", style: GoogleFonts.alata()),
            trailing: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Text("View Profile",
                    style: GoogleFonts.amaranth(
                      color: Colors.white,
                    ))),
          );
        },
      ),
    );
  }
}
