import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/projectmodel.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/project_store.dart';

import '../../model/agentmodel.dart';
import '../../viewmodel/agent_store.dart';

class ScreenAgentAddProject extends StatefulWidget {
  const ScreenAgentAddProject({super.key});

  @override
  State<ScreenAgentAddProject> createState() => _ScreenAgentAddProjectState();
}

class _ScreenAgentAddProjectState extends State<ScreenAgentAddProject> {
  Uint8List? _image;
  imagePickforproject(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No iMage selected");
    }
  }

  void selectimageforproject() async {
    Uint8List img = await imagePickforproject(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    ProjectStore projectobj = ProjectStore();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return ScreenHomeAgent();
                  },
                ));
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: Colors.black,
              )),
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
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        selectimageforproject();
                      },
                      child: Text(
                        "Add Image",
                        style: GoogleFonts.manrope(color: Colors.black),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  _image != null
                      ? CircleAvatar(
                          radius: 20,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const SizedBox()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 13, 42, 91)),
                    onPressed: () {
                      ProjectDetailsModel agentobj = ProjectDetailsModel(
                        agentaddprojectname:
                            funprovider.agentaddprojectname.text,
                        agentaddplace: funprovider.agentaddplace.text,
                        agentaddstartdate: funprovider.agentaddstartdate.text,
                        agentaddenddate: funprovider.agentaddenddate.text,
                        agentaddnoworers: funprovider.agentaddnoworers.text,
                        agentaddbudget: funprovider.agentaddbudget.text,
                        agentaddmanager: funprovider.agentaddmanager.text,
                      );
                      projectobj.addprojectdetails(
                        agentobj,
                      );
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
