import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/managermodel.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';

import '../../viewmodel/managerstore.dart';

class ScreenAddManager extends StatelessWidget {
  const ScreenAddManager({super.key});

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    ManagerService managermodel = ManagerService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Add Manager",
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.error))]),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Place",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagerplace,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Age",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagerage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ID Number",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagerIdnumber,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " Email",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanageremail,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ID",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagerid,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " Password",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentmanagerpassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Add Image",
                    style: GoogleFonts.manrope(color: Colors.black),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 13, 42, 91)),
                    onPressed: () {
                      managermodel.addManager(ManagerModel(
                          managername: funprovider.agentmanagername.text,
                          managerplace: funprovider.agentmanagerplace.text,
                          managerage: funprovider.agentmanagerage.text,
                          manageridnumber: funprovider.agentmanagerIdnumber.text,
                          manageremail: funprovider.agentmanageremail.text,
                          managerid: funprovider.agentmanagerid.text,
                          managerpassword: funprovider.agentmanagerpassword.text

                          ));
                    },
                    child: Text(
                      " Update",
                      style: GoogleFonts.manrope(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
