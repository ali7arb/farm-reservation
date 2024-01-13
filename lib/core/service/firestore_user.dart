import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_farm/model/users/user_model.dart';

class FireStoreUser {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await userCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await userCollection.doc(uid).get();
  }
}
