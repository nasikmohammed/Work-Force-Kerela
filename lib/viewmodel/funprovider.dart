import 'dart:io';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/usermodel.dart';
import 'package:country_picker/country_picker.dart';
import 'package:workforce_project/viewmodel/userfirestore.dart';

class FunProvider extends ChangeNotifier {
  UserModel usermodelobj = UserModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  EmailOTP myAuth = EmailOTP();
  final formkey = GlobalKey<FormState>();
  final formkeyregister = GlobalKey<FormState>();

  final RegExp emailregexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp aadharpattern = RegExp('[a-zA-Z0-9./-_]{2,256}@[a-zA-Z]{2,64}');
  FirestoreService firestore = FirestoreService();
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
  //screen report problems
  final reportproblemcontroller = TextEditingController();
  //screenpersonalinformation
  final usernamepcontroller = TextEditingController();
  final useraddresscontroller = TextEditingController();
  final usercontactnumbercontroller = TextEditingController();
  final userserstatecontroller = TextEditingController();
  final usercitycontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final userpasswordcontroller = TextEditingController();
  final userwebsitecontroller = TextEditingController();
  final usercompanylogocontroller = TextEditingController();

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

  Future signup(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailidcontroller.text, password: passwordcontroller.text)
          .then((value) {
        firestore.addUser(
            UserModel(
                firstname: firstnamecontroller.text,
                lastname: lastnamecontroller.text,
                country: countrycontroller.text,
                address: addresscontroller.text,
                city: citycontroller.text,
                email: emailidcontroller.text,
                aadharnumber: aadhaarcontroller.text,
                martialstatus: meterialstatuscontroller.text),
            value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 159, 58, 58),
          content: Text("invalid  email"),
          action: SnackBarAction(
            label: "Undo",
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));
      }
    }
  }

  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();
  }

  signin() async {
    await auth
        .signInWithEmailAndPassword(
            email: emailidcontroller.text, password: passwordcontroller.text)
        .then((credentisl) {
      if (credentisl.user!.emailVerified) {
      } else {
        credentisl.user!.sendEmailVerification();
      }
    });
  }

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

  verifyOTP(context) async {
    if (await myAuth.verifyOTP(otp: otpcontroller.text) == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP is verified"),
      ));
      await signup(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid OTP"),
      ));
    }
  } //          Screen USER signup (signup with google)

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//screen register
  File? images;
  imagePickforregister() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      images = File(pickedImage.path);
    }
  }
//screen register

  countrypicker(context) async {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        print('Select country: ${country.displayName}');
      },
    );
  }
}
