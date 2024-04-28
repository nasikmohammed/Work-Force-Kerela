import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workforce_project/model/agentmodel.dart';

import '../model/usermodel.dart';

class AgenteService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("AGENT");
  Future addUser(AgentModel agentModel) async {
    final doc = db.collection("AGENT").doc();

    doc.set(agentModel.toJson(doc.id));
    
  }
   
}
