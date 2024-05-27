// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:workforce_project/view/admin/screen_verified_registrations.dart';
// import 'package:workforce_project/viewmodel/function_provider.dart';

// class ScreenRegisterOn extends StatelessWidget {
//   const ScreenRegisterOn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final funprovider = Provider.of<FunProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 100),
//               child: Column(
//                 children: [
//                   Text(
//                     "agencyname",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agencyname,
//                   ),
//                   Text(
//                     "address",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentrgaddress,
//                   ),
//                   Text(
//                     "contactnumber",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentcontactnumber,
//                   ),
//                   Text(
//                     "State",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentrgstate,
//                   ),
//                   Text(
//                     "city",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentrgcity,
//                   ),
//                   Text(
//                     "email",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentrgemail,
//                   ),
//                   Text(
//                     "password",
//                     style: GoogleFonts.adamina(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                     controller: funprovider.agentrgpassword,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         funprovider.signupwithAgent(context).then(
//                           (value) {
//                             funprovider.sendEmail(
//                                 funprovider.agentrgpassword.text,
//                                 ('Work force kerela Login Password is:${funprovider.agentrgpassword.text}'),
//                                 funprovider.agentrgemail.text);
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) {
//                                 return ScreenVerifiedRegisstrations();
//                               },
//                             ));
//                           },
//                         );
//                       },
//                       child: Text("Register"))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
