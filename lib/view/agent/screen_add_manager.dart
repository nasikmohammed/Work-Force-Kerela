import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/managermodel.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

import '../../viewmodel/manager_store.dart';

class ScreenAddManager extends StatefulWidget {
  const ScreenAddManager({super.key});

  @override
  State<ScreenAddManager> createState() => _ScreenAddManagerState();
}

class _ScreenAddManagerState extends State<ScreenAddManager> {
  Uint8List? _image;
  String _uploadurl = "";

  imagePickformanager(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No iMage selected");
    }
  }

  void selectimage() async {
    Uint8List img = await imagePickformanager(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  Future<String> upload({required File file}) async {
    try {
      Reference storage = FirebaseStorage.instance.ref().child("profile");
      UploadTask uploadTask = storage.putFile(file);
      _uploadurl =
          await uploadTask.then((result) => result.ref.getDownloadURL());
    } catch (e) {
      log(e.toString() as num);
    }
    return _uploadurl;
  }

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    ManagerService managermodel = ManagerService();
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
            ),
          ),
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
        padding: const EdgeInsets.only(left: 25, right: 25),
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
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.emailAddress,
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
                obscureText: true,
                controller: funprovider.agentmanagerpassword,
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
                        selectimage();
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
                      : CircleAvatar(),
                ],
              ),
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
                          manageridnumber:
                              funprovider.agentmanagerIdnumber.text,
                          manageremail: funprovider.agentmanageremail.text,
                          managerid: funprovider.agentmanagerid.text,
                          managerpassword:
                              funprovider.agentmanagerpassword.text,
                          image: _uploadurl));
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
