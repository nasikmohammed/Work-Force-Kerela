import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/provider.dart';

class ScreenHomeAgent extends StatelessWidget {
  const ScreenHomeAgent({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          "Work force kerela",
          style: GoogleFonts.righteous(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.error,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(workprovider.construction1)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 500),
            child: Container(
              height: 200,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction2,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 300),
            child: Container(
              height: 180,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction3,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 210, top: 300),
            child: Container(
              height: 400,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction4,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
