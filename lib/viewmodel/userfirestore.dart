import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:workforce_project/viewmodel/funprovider.dart';

import '../model/usermodel.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("USER");
  Future addUser(UserModel userModel, uid) async {
    final doc = db.collection("USER").doc(uid);

    doc.set(userModel.toJson(doc.id));
  }

  UserModel? singleuserData;

  Future getSingleUserData(context, docId) async {
    print("okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    var funprovider = Provider.of<FunProvider>(context);
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("USER").doc(docId).get();
    if (docSnapshot.exists) {
      print(docSnapshot);
      print("object");

      singleuserData = UserModel.fromJson(docSnapshot.data()!);
      funprovider.usermodelobj = singleuserData!;
    }
    print(funprovider.usermodelobj.firstname);
  }
}
