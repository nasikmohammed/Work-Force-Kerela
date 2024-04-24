import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';

import '../model/usermodel.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("USER");
  Future addUser(UserModel userModel,uid) async {
    final doc = db.collection("USER").doc(uid);

    doc.set(userModel.toJson(doc.id));
  }

  UserModel? singleuserData;
  Future getSingleUserData(context, docId) async {
    print("xxkscdcdxcd,.    . d");
    var funpprovider = Provider.of<FunProvider>(context);
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("USER").doc(docId).get();
    if (docSnapshot.exists) {
      print(docSnapshot);
      print("dfdefodddddddddddddddddddddddddddddddddddddddddddddd");
      singleuserData = UserModel.fromJson(docSnapshot.data()!);
      funpprovider.usermodelobj = singleuserData!;
      print(
          "((999999999999999999999999999999999999999999999999uj9uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999999999999))");
    }
    print(funpprovider.usermodelobj.firstname);
    print(
        "((99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999))");
  }
}
