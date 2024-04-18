import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/usermodel.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("USER");
  Future addUser(UserModel userModel) async {
    final doc = db.collection("USER").doc();

    doc.set(userModel.toJson(doc.id));
   }
  //UserModel? singleuserData;
  // getSingleUserData(docId) async {
  //   DocumentSnapshot<Map<String, dynamic>> docSnapshot =
  //       await db.collection("Players ID").doc(docId).get();
  //   if (docSnapshot.exists) {
  //     singleuserData = UserModel.fromJson(docSnapshot.data()!);
  //   }
  //   print(singleuserData!.firstname);
  // }
}
