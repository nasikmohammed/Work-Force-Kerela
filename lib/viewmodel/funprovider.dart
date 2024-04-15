import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class FunProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  //          Screen USER signup (signup with google)

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

  final formkey = GlobalKey<FormState>();
  final formkeyregister = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final RegExp emailregexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  //          SCREEN REGISTER
  File? images;
  imagePickforregister() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      images = File(pickedImage.path);
    }
  } //SCREEN REGISTER

  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final emailidcontroller = TextEditingController();
  final aadhaarcontroller = TextEditingController();
  final meterialstatuscontroller = TextEditingController();

  signup(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailidcontroller.text, password: passwordcontroller.text)
          .then((value) async {
        await verifyemail();
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
        print("helllllllllllllll");
      } else {
        credentisl.user!.sendEmailVerification();
      }
    });
  }
}
