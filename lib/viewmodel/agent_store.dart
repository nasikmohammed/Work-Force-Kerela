import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:workforce_project/model/agentmodel.dart';
import 'package:workforce_project/viewmodel/function_provider.dart';

class AgenteService {
  final db = FirebaseFirestore.instance;
  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");
  Future addUser(AgentModel agentModel) async {
    final doc = db.collection("AGENT").doc();
    doc.set(agentModel.toJson(doc.id));
  }

  AgentModel? singleagentuserData;

  Future getSingleUserData(
    context,
  ) async {
    print("fgfggffgh");
    var funprovider = Provider.of<FunProvider>(context);
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("AGENT").doc().get();
    if (docSnapshot.exists) {
      singleagentuserData = AgentModel.fromJson(docSnapshot.data()!);
      funprovider.agentmodelobj = singleagentuserData!;
    }

    print(
        "AGENT firebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbase");

    print(funprovider.agentmodelobj.agencyname);
    print(
        "AGENT firebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbase");
  }
}
