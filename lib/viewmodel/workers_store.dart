import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workforce_project/model/managermodel.dart';
import 'package:workforce_project/model/workersmodel.dart';

class WorkersStore{
   final db = FirebaseFirestore.instance;
  final CollectionReference agent =
      FirebaseFirestore.instance.collection("WORKERS");
  Future addWorkers(WorkersModel workersModel) async {
    final doc = db.collection("WORKERS").doc();
    doc.set(workersModel.toJson(doc.id));
  }
}