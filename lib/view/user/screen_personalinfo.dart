import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenUserPersonalInfo extends StatelessWidget {
  const ScreenUserPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 247, 255, 222),
          elevation: 0,
          title: workprovider.isselected
              ? Text(
                  "Update Profile",
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              : Text(
                  "Personal information",
                  style: GoogleFonts.nunitoSans(
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
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(workprovider.person),
          ),
          Text(
            "Sandeep K",
            style: GoogleFonts.nunitoSans(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 330),
            child: IconButton(
                onPressed: () {
                  workprovider.selectAvailable();
                },
                icon: Icon(Icons.swipe_up_rounded)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 244, 244),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Address",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contact Number",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "State",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "City",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email ID",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Website",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Company Logo",
                          style: GoogleFonts.ubuntu(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        workprovider.isselected
                            ? Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 57, 73, 163),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.amaranth(
                                          color: Colors.white),
                                    )),
                              )
                            : const SizedBox()
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
