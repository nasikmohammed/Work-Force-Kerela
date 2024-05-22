import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:workforce_project/model/agentmodel.dart';
import 'package:workforce_project/model/user_report_model.dart';
import 'package:workforce_project/model/usermodel.dart';
import 'package:workforce_project/model/workersmodel.dart';
import 'package:workforce_project/view/admin/screen_registeron_employee.dart';
import 'package:workforce_project/view/user/screen_user_home.dart';
import 'package:workforce_project/viewmodel/agent_store.dart';
import 'package:workforce_project/viewmodel/user_store.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:workforce_project/viewmodel/workers_store.dart';

class FunProvider extends ChangeNotifier {
  String? imageurl = "";
  String? uid = "";
  UserModel usermodelobj = UserModel();
  AgentModel agentmodelobj = AgentModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  EmailOTP myAuth = EmailOTP();
  final formkey = GlobalKey<FormState>();
  final adminloginkey = GlobalKey<FormState>();
  final formkeyregister = GlobalKey<FormState>();
  List managerlist = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('AGENT');
  FirebaseStorage storage = FirebaseStorage.instance;

  final RegExp emailregexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final adminuid = "RJXMfFwvxgTU5TfW4uHqB5kwcak2";
  FirestoreService firestore = FirestoreService();
  AgenteService agentstor = AgenteService();
  //          SCREEN REGISTER
  //screen signup

  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  //SCREEN REGISTER
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final emailidcontroller = TextEditingController();
  final aadhaarcontroller = TextEditingController();
  final meterialstatuscontroller = TextEditingController();
  //screen otp
  final otpcontroller = TextEditingController();
  //screen login
  final loginusernamecontroller = TextEditingController();
  final loginpasswordcontroller = TextEditingController();
  //screen Userreport problems
  final reportproblemcontroller = TextEditingController();
  //screen Managerreport problems
  final managerreportproblemcontroller = TextEditingController();
  //screenpersonalinformation
  final usernamepcontroller = TextEditingController();
  final userplacecontroller = TextEditingController();
  final useragecontroller = TextEditingController();
  final usersercontroller = TextEditingController();
  final useridnumbercontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final useridcontroller = TextEditingController();
  final userpasswordcontroller = TextEditingController();

//Agent Controller
  final agencynamecontroller = TextEditingController();
  final agentaddresscontroller = TextEditingController();
  final agentcompanynamecontroller = TextEditingController();
  final agentcontactnumbercontrroller = TextEditingController();
  final agentstatecontroller = TextEditingController();
  final agentcitycontroller = TextEditingController();
  final agentemailecontroller = TextEditingController();
  final agentpasswordcontroller = TextEditingController();
  final agentconfirmpasswordcontroller = TextEditingController();
  final agentwebsitecontroller = TextEditingController();
  //admin(Register As an Employee)
  final agencyname = TextEditingController();
  final agentcontactnumber = TextEditingController();
  final agentrgstate = TextEditingController();
  final agentrgaddress = TextEditingController();
  final agentrgcity = TextEditingController();
  final agentrgemail = TextEditingController();

  final agentcompanyname = TextEditingController();
  final agentrgpassword = TextEditingController();
  //AGENT Add Project
  final agentaddprojectname = TextEditingController();
  final agentaddplace = TextEditingController();
  final agentaddstartdate = TextEditingController();
  final agentaddenddate = TextEditingController();
  final agentaddnoworers = TextEditingController();
  final agentaddbudget = TextEditingController();
  final agentaddmanager = TextEditingController();
  //Agent AddManager
  final agentmanagername = TextEditingController();
  final agentmanagerplace = TextEditingController();
  final agentmanagerage = TextEditingController();
  final agentmanagerIdnumber = TextEditingController();
  final agentmanageremail = TextEditingController();
  final agentmanagerid = TextEditingController();
  final agentmanagerpassword = TextEditingController();
  //Agent Add Workers
  final workername = TextEditingController();
  final workerplace = TextEditingController();
  final workerage = TextEditingController();
  final workeridnumber = TextEditingController();
  final workeremail = TextEditingController();
  final workerid = TextEditingController();
  final workerpassword = TextEditingController();

  final workerlogemail = TextEditingController();

  final workerlogpassword = TextEditingController();
  //update
  final workernameupdate = TextEditingController();

  //update agent profile

  var agentupdatename = TextEditingController();
  final agentupdateaddress = TextEditingController();
  final agentupdatecity = TextEditingController();
  final agentupdatestate = TextEditingController();
  final agentupdatecontactnumber = TextEditingController();
  final agentupdateemail = TextEditingController();
  final agentupdatepassword = TextEditingController();

  //managerController
  final managernamecontroller = TextEditingController();
  final manageraddresscontroller = TextEditingController();
  final managercontactnumbercontroller = TextEditingController();
  final managerstatecontroller = TextEditingController();
  final managercitycontroller = TextEditingController();
  final manageremailcontroller = TextEditingController();
  final managerpasswordcontroller = TextEditingController();

  //police
  final policenamecontroller = TextEditingController();
  final policeaddresscontroller = TextEditingController();
  final policecontactnumbercontroller = TextEditingController();
  final policestatecontroller = TextEditingController();
  final policecitycontroller = TextEditingController();
  final policeemailcontroller = TextEditingController();
  final policepasswordcontroller = TextEditingController();
  //admin
  final adminemailcontroller = TextEditingController();
  final adminpasswordcontroller = TextEditingController();

  // Future signup(context) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //             email: emailidcontroller.text, password: passwordcontroller.text)
  //         .then((value) {
  //       firestore.addUser(
  //           UserModel(
  //               contactnumber: usercontactnumbercontroller.text,
  //               firstname: firstnamecontroller.text,
  //               lastname: lastnamecontroller.text,
  //               country: countrycontroller.text,
  //               address: addresscontroller.text,
  //               city: citycontroller.text,
  //               email: emailidcontroller.text,
  //               aadharnumber: aadhaarcontroller.text,
  //               martialstatus: meterialstatuscontroller.text),
  //           value.user!.uid);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "email-already-in-use") {
  //       return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         duration: Duration(seconds: 3),
  //         backgroundColor: Color.fromARGB(255, 159, 58, 58),
  //         content: Text("invalid  email"),
  //         action: SnackBarAction(
  //           label: "Undo",
  //           textColor: Colors.white,
  //           onPressed: () {},
  //         ),
  //       ));
  //     }
  //   }
  // }

  // verifyemail() async {
  //   await auth.currentUser?.sendEmailVerification();
  // }

  // signin() async {
  //   await auth
  //       .signInWithEmailAndPassword(
  //           email: emailidcontroller.text, password: passwordcontroller.text)
  //       .then((credentisl) {
  //     if (credentisl.user!.emailVerified) {
  //     } else {
  //       credentisl.user!.sendEmailVerification();
  //     }
  //   });
  // }

  Future emailotp(context) async {
    myAuth.setConfig(
        appEmail: "Firebasehub@gmail.com",
        appName: "OTP VERIFICATION",
        userEmail: emailidcontroller.text,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myAuth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  // verifyOTP(context) async {
  //   if (await myAuth.verifyOTP(otp: otpcontroller.text) == true) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("OTP is verified"),
  //     ));
  //     await signup(context);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Invalid OTP"),
  //     ));
  //   }
  // } //          Screen USER signup (signup with google)

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

//screen register
  // Uint8List? _image;
  // File? images;
  // String uploadurl = "";
  // imagePick2(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  //   // XFile? pickedImage =
  //   //     await ImagePicker().pickImage(source: ImageSource.gallery);
  //   // if (pickedImage != null) {
  //   //   images = File(pickedImage.path);
  //   //   Reference storageurl = FirebaseStorage.instance.ref().child(images!.path);
  //   //   print(storageurl);

  //   //   UploadTask uploadimages = storageurl.putFile(images!);
  //   //   uploadurl =
  //   //       await uploadimages.then((result) => result.ref.getDownloadURL());
  //   // }
  // }

  // void selectimage() async {
  //   Uint8List img = await imagePick2(ImageSource.gallery);
  //   _image = img;

  // }

//screen register

  // countrypicker(context) async {
  //   return showCountryPicker(
  //     context: context,
  //     showPhoneCode: true,
  //     onSelect: (Country country) {
  //       print('Select country: ${country.displayName}');
  //     },
  //   );
  // }
  final updateagentname = TextEditingController();

  //admin login function
  checkadminemail(context) {
    auth
        .signInWithEmailAndPassword(
            email: adminemailcontroller.text,
            password: adminpasswordcontroller.text)
        .then((credential) {
      if (credential.user!.uid == adminuid) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ScreenRegisterAnEmployee(),
            ),
            (route) => false);
      } else {
        auth.signOut();
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email and Password is Doesn't match")));
      }
    }).onError((error, stackTrace) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email and Password is Doesn't Match")));
    });
  } //////////////////////////////////////////////////////////////////////////////////////

  // imagePick(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  // }

  // Uint8List? _image;

  // imagePickfromgallery(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  // }

  // void selectimage() async {
  //   notifyListeners();
  //   Uint8List img = await imagePickfromgallery(ImageSource.gallery);

  //   _image = img;
  //   notifyListeners();
  // }
  emailsend() async {
    print("email.send");
    final Email email = Email(
      body: agentmanageremail.text,
      subject: agentmanagerpassword.text,
      cc: ['cc@example.com'],
      bcc: ['bcc@example.com'],
      attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

// screenAddworkers//
  pickimagefromgallery() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurl = await referencetoimageupload.getDownloadURL();
    } catch (error) {
      print(error);
    }
  }

  datepickforstrtdate(context) async {
    final DateTime? selecteddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    final formatteddate = DateFormat("dd/MM/yyyy").format(selecteddate!);

    print(formatteddate);

    // print(selecteddate);
    agentaddstartdate.text = formatteddate.toString();
    notifyListeners();
  }

  datepickforenddate(context) async {
    final DateTime? selecteddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    final formatteddate = DateFormat("dd/MM/yyyy").format(selecteddate!);

    print(formatteddate);

    agentaddenddate.text = formatteddate.toString();
    notifyListeners();
  }

  Future<void> showagentnamedialoguealert(context, String name) async {
    workernameupdate.text = name;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Edit name",
              style: GoogleFonts.anekDevanagari(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: workernameupdate,
                  style: GoogleFonts.overpass(),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "  Text your Agency name...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.nunito(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.indigo),
                onPressed: () {
                  final CollectionReference agent =
                      FirebaseFirestore.instance.collection("AGENT");
                  print("update");
                  update();
                  Navigator.pop(context);
                },
                child: Text(
                  "Update",
                  style: GoogleFonts.nunito(color: Colors.white),
                )),
          ],
        );
      },
    );
  }

  update() {
    final DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
        .instance
        .collection("WORKERS")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    user.update({
      "workersname": workernameupdate.text,
    });
  }

  sendEmail(String subject, String body, String recipientmail) async {
    final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipientmail],
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  clearAddworkersField() {
    workername.clear();
    workerplace.clear();
    workerage.clear();
    workeridnumber.clear();
    workeremail.clear();
    workerid.clear();
    workerpassword.clear();
  }

  Future signupwith(context) async {
    WorkersStore store = WorkersStore();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: workeremail.text, password: workerpassword.text)
          .then((value) {
        String uid = value.user!.uid;
        //  DocumentSnapshot ds = snapshot.
        store.addWorkers(
            WorkersModel(
                workersname: workername.text,
                workersplace: workerplace.text,
                workersidnumber: workeridnumber.text,
                workersemail: workeremail.text,
                workersage: workerage.text,
                workersid: workerid.text,
                workerimage: imageurl,
                workerspassword: workerpassword.text,
                id: uid),
            uid);

        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  signin(context) async {
    print(workerlogemail.text);
    try {
      await auth
          .signInWithEmailAndPassword(
              email: workerlogemail.text, password: workerlogpassword.text)
          .then(
        (credential) {
          String id = credential.user!.uid;

          print(id);
          final snackBar = SnackBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            content: Text(
              "Login Succesfully",
              style: GoogleFonts.sarabun(),
            ),
          );

          // Display the Snackbar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ScreenUserHome();
            },
          ));
        },
      );
    } catch (e) {
      print("ccccccccccccccccccccccccccccccc");
      print(e.toString());
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Check Your Emai and Password",
          style: GoogleFonts.plusJakartaSans(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Display the Snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  WorkersModel? workersModel;
  String? workname;
  String? workplace;
  String? workage;
  String? workidnumber;
  String? workemail;
  String? workid;
  String? workpassword;
  String? workimage;

  fetchCurrentUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("WORKERS")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      workersModel = WorkersModel.fromJson(snapshot.data()!);
      workname = workersModel!.workersname;
      workplace = workersModel!.workersplace;
      workage = workersModel!.workersage;
      workidnumber = workersModel!.workersidnumber;
      workemail = workersModel!.workersemail;
      workid = workersModel!.workersemail;
      workpassword = workersModel!.workerspassword;
      workimage = imageurl;
      print(workname);
      print(workersModel!.workersage);
      print(workersModel!.workersplace);
    }
  }

// SPECIFIED DATA FETCHING FROM ONE COLLECTION IN SCREEN
  List<UserReportsModel> userreportModel = [];
  Future getreport() async {
    final snapshot = await db
        .collection('UserReports')
        .where(
          'reportid',
          isEqualTo: auth.currentUser!.uid,
        )
        .get();

    userreportModel = snapshot.docs.map((doc) {
      return UserReportsModel.fromJson(doc.data());
    }).toList();
  }
}
