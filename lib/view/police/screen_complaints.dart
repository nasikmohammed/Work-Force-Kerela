import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/view/agent/screen_availableworkers.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenComplaints extends StatelessWidget {
  const ScreenComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Complaints",
          style: GoogleFonts.righteous(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: () {},
                        contentPadding: EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        title: Text(
                          workprovider.complaints[index],
                          style: GoogleFonts.signikaNegative(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        trailing: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(45)),
                          child: Center(
                              child: Text(
                            "140",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
