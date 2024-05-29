import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:workforce_project/model/workersmodel.dart';

class WorkersStore {
  final db = FirebaseFirestore.instance;
  final CollectionReference agent =
      FirebaseFirestore.instance.collection("WORKERS");
  String id = randomAlphaNumeric(10);
  Future addWorkers(WorkersModel workersModel, uid, id) async {
    final doc = db.collection("WORKERS").doc(id);
    doc.set(workersModel.toJson(doc.id));
  }
}
