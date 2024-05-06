import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workforce_project/model/user_report_model.dart';

class UserReportService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("UserReports");
  Future addUserreports(UserReportsModel userreportModel, uid) async {
    final doc = db.collection("UserReports").doc(uid);

    doc.set(userreportModel.toJson(doc.id));
  }
}
