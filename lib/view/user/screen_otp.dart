import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:provider/provider.dart';
import 'package:workforce_project/view/police/screen_aboutus.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/view/user/screen_userprofile.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';
import 'package:workforce_project/viewmodel/ui_work_provider.dart';

import '../../model/usermodel.dart';
import '../../viewmodel/user_store.dart';

class ScreenOtp extends StatelessWidget {
  ScreenOtp({super.key});
  final firestore = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: funprovider.otpcontroller,
          ),
          ElevatedButton(
              onPressed: () {
             //   funprovider.verifyOTP(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenUserPersonalInfo(),
                ));
              },
              child: Text("Sumbit")),
        ],
      ),
    );
  }
}
