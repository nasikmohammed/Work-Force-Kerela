import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workforce_project/model/managermodel.dart';

class ManagerService {
  final db = FirebaseFirestore.instance;
  final CollectionReference agent =
      FirebaseFirestore.instance.collection("MANAGER");
  Future addManager(ManagerModel managerModel, uid) async {
    final doc = db.collection("MANAGER").doc(uid);
    doc.set(managerModel.toJson(uid));
  }
}
