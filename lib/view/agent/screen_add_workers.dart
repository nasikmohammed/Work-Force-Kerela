import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/workersmodel.dart';
import 'package:workforce_project/view/agent/screen_homeagent.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/workers_store.dart';

class ScreenAddWorker extends StatefulWidget {
  const ScreenAddWorker({super.key});

  @override
  State<ScreenAddWorker> createState() => _ScreenAddWorkerState();
}

class _ScreenAddWorkerState extends State<ScreenAddWorker> {
  Uint8List? _image;
  imagePickforworkers(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No iMage selected");
    }
  }

  void selectimageforworkers() async {
    Uint8List img = await imagePickforworkers(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    WorkersStore workersobj = WorkersStore();
    final funprovider = Provider.of<FunProvider>(context);
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
            "Add Workers",
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
                controller: funprovider.workername,
                keyboardType: TextInputType.name,
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
                controller: funprovider.workerplace,
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
                controller: funprovider.workerage,
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
                controller: funprovider.workeridnumber,
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
                controller: funprovider.workeremail,
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
                controller: funprovider.workerid,
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
                controller: funprovider.workerpassword,
                keyboardType: TextInputType.visiblePassword,
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
                      onPressed: () async {
                        //selectimageforworkers();
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print(".................${file?.path}");
                        if (file == null) return;
                        String uniquefilename =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        Reference referencRoot = FirebaseStorage.instance.ref();
                        Reference referencedirimage =
                            referencRoot.child("images");
                        Reference referencetoimageupload =
                            referencedirimage.child(uniquefilename);
                        try {
                          await referencetoimageupload.putFile(File(file.path));
                          imageUrl =
                              await referencetoimageupload.getDownloadURL();
                        } catch (error) {
                          print(error); 
                        }
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
                        backgroundColor: Color.fromARGB(255, 13, 42, 91)),
                    onPressed: () {
                      workersobj.addWorkers(WorkersModel(
                        workersname: funprovider.workername.text,
                        workersplace: funprovider.workerplace.text,
                        workersage: funprovider.workerage.text,
                        workersidnumber: funprovider.workeridnumber.text,
                        workersemail: funprovider.workeremail.text,
                        workersid: funprovider.workerid.text,
                        workerspassword: funprovider.workerpassword.text,
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
