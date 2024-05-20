import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

class ScreenUserNotifications extends StatelessWidget {
  const ScreenUserNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
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
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text(
              "Just Now",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(workprovider.construction2)),
                  title: Text(
                    "Your complaint for the issue in your work place has been registered on nearby police station",
                    style: GoogleFonts.amaranth(
                        fontSize: 12, fontWeight: FontWeight.bold),
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
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
