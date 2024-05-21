import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:workforce_project/view/user/screen_personalinfo.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

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
