import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(workprovider.person)),
                  title: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Text(
                          "Harshal singh",
                          style: GoogleFonts.amaranth(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(Manager)",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          "has registered an employee",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 210),
                    child: Text(
                      "10 minutes ago",
                      style: GoogleFonts.quicksand(fontSize: 12),
                    ),
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
