import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';

import '../../model/agentmodel.dart';
import '../../viewmodel/agentfirestore.dart';

class ScreenAgentAddProject extends StatelessWidget {
  const ScreenAgentAddProject({super.key});

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    AgenteService agentobbj = AgenteService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Add Project",
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
                "Project name",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddprojectname,
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
                controller: funprovider.agentaddplace,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Start Date",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddstartdate,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "End Date",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddenddate,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " No. of workers",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddnoworers,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " Budget",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddbudget,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " Manager",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: funprovider.agentaddmanager,
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
                      AgentModel agentobj = AgentModel(
                        agentaddprojectname:
                            funprovider.agentaddprojectname.text,
                        agentaddplace: funprovider.agentaddplace.text,
                        agentaddstartdate: funprovider.agentaddstartdate.text,
                        agentaddenddate: funprovider.agentaddenddate.text,
                        agentaddnoworers: funprovider.agentaddnoworers.text,
                        agentaddbudget: funprovider.agentaddbudget.text,
                        agentaddmanager: funprovider.agentaddmanager.text,
                      );
                      agentobbj.addUser(agentobj);
                      print("dkmeregkrgrgkr");
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
