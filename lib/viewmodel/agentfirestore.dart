import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/model/agentmodel.dart';

import '../model/usermodel.dart';
import 'funprovider.dart';

class AgenteService {
  final db = FirebaseFirestore.instance;
  final CollectionReference agentcollection =
      FirebaseFirestore.instance.collection("AGENT");
  Future addUser(AgentModel agentModel, ) async {
    final doc = db.collection("AGENT").doc();

    doc.set(agentModel.toJson(doc.id));
  }

  AgentModel? singleuseragentData;
  Future getSingleUserDataagent(context, docId) async {
    print("singleuseragentdata");
    var funpprovider = Provider.of<FunProvider>(context);
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("AGENT").doc(docId).get();
    if (docSnapshot.exists) {
      print(docSnapshot);

      singleuseragentData = AgentModel.fromJson(docSnapshot.data()!);
      funpprovider.agentmodelobj = singleuseragentData!;
    }
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(funpprovider.agentmodelobj.agentcity);
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
  }
}
