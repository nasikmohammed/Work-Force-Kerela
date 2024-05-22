import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:workforce_project/model/user_report_model.dart';

class UserReportService {
  final db = FirebaseFirestore.instance;
  String id = randomAlphaNumeric(10);
  Future addUserreports(UserReportsModel userreportModel, uid, id) async {
    final doc = db.collection("UserReports").doc(id);

    doc.set(userreportModel.toJson(doc.id));
  }
}
