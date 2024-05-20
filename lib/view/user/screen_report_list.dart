import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenUserReportList extends StatelessWidget {
  const ScreenUserReportList({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenUserHome();
                },
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        title: Text(
          "Report List",
          style: GoogleFonts.content(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "Just Now",
            style: GoogleFonts.bellota(fontSize: 20),
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(workprovider.adminverifyy),
                  ),
                  title: const Text(
                      "Your Complaint for the issue in your work place has been registered on nearby Police station"),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromARGB(255, 114, 107, 107),
                );
              },
              itemCount: 15,
            ),
          )
        ],
      ),
    );
  }
}
