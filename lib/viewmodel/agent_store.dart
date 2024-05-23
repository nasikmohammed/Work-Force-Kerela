import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:workforce_project/model/agentmodel.dart';

class AgenteService {
  final db = FirebaseFirestore.instance;
  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");
  Future addUser(AgentModel agentModel, uid) async {
    final doc = db.collection("AGENT").doc();
    doc.set(agentModel.toJson(uid));
  }

  //AgentModel? singleagentuserData;

  // Future getSingleUserData(
  //   context,
  // ) async {
  //   print("fgfggffgh");
  //   var funprovider = Provider.of<FunProvider>(context);
  //   DocumentSnapshot<Map<String, dynamic>> docSnapshot =
  //       await db.collection("AGENT").doc().get();
  //   if (docSnapshot.exists) {
  //     singleagentuserData = AgentModel.fromJson(docSnapshot.data()!);
  //     funprovider.agentmodelobj = singleagentuserData!;
  //   }

  //   print(
  //       "AGENT firebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbase");

  //   print(funprovider.agentmodelobj.agencyname);
  //   print(
  //       "AGENT firebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbase");
  // }

//   Stream<List<AgentModel>> getalldata(context) {
//     var funprovider = Provider.of<FunProvider>(context);
//     try {
//       return agent.snapshots().map((QuerySnapshot snapshot) {
//         return snapshot.docs.map((DocumentSnapshot doc) {
//             funprovider.agentmodelobj = singleagentuserData!;
//           return AgentModel.fromJson(doc as Map<String, dynamic>);

//         }).toList();
//       });
//     } on FirebaseException catch (e) {
//       print(e);
//       throw (e);
//     }
//   }
//Update in CRUD
  // updateAgent(AgentModel agentModel) async {
  //   try {
  //     final agentmap = agentModel.toJson();
  //     await FirebaseFirestore.instance
  //         .collection("AGENT")
  //         .doc(agentModel.id)
  //         .update(agentmap);
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //   }

  // }
//Delete in CRUD
  // deleteagentdata(String? id) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("AGENT")
  //         .doc(agent.id)
  //         .delete();
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<Stream<QuerySnapshot>> getsingleagentdata() async {
  //   return await FirebaseFirestore.instance.collection("AGENT").snapshots();
  // }
}
