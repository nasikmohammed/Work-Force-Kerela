
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workforce_project/model/manager_report_model.dart';

class ManagerReportService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("ManagerReports");
  Future addManagerreports(ManagerReportModel ManagerreportModel, ) async {
    final doc = db.collection("ManagerReports").doc();

    doc.set(ManagerreportModel.toJson(doc.id));
  }
}