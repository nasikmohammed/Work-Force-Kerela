import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkProvider extends ChangeNotifier {
  String selectedoption = "Carpenter";
  List department = ["Carpenter", "Electrician", "Construction"];
  workassigndropdown(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 350, bottom: 260),
          child: Container(
            width: 100,
            height: 100,
            color: Color.fromARGB(255, 201, 191, 190),
            // child: DropdownButtonFormField(
            //   value: selectedoption,
            //   items: department.map<DropdownMenuItem>((e) {
            //     return DropdownMenuItem(value: e,
            //       child: Text(e));
            //   }).toList(),
            //   onChanged: (value) {
            //     selectedoption = value!;
            //   },
            // ),
          ),
        );
      },
    );

    
  }
}
