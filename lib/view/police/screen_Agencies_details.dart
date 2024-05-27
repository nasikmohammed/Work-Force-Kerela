import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workforce_project/model/agentmodel.dart';

class ScreenAgenciesDetails extends StatelessWidget {
  const ScreenAgenciesDetails({required this.agentModel});
  final AgentModel agentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          height: 620,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 232, 232),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "AGENT DETAILS",
                style: GoogleFonts.urbanist(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 150,
                  width: 500,
                  child: Image.network(agentModel.image!)),
              const SizedBox(
                height: 30,
              ),
              Text("Agent Name",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.agencyname!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold)),
              Text("Agent Address :",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.agentaddress!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold)),
              Text("Agent City",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.agentcity!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold)),
              Text("State",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.agentstate!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold)),
              Text("Contact Number",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.contactnumber!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold)),
              Text("Agent Email",
                  style: GoogleFonts.catamaran(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(agentModel.agentemail!,
                  style: GoogleFonts.catamaran(fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
