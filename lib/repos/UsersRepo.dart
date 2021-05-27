import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_app/models/UserModel.dart';

class UsersRepo {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  static registerAndSignIn(String email, password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return _users
        .add(UserModel(email: email, uid: userCredential.user.uid).toJson());
  }

  static Future<List<UserModel>> getUsers() async {
    return await _users.get().then((users) =>
        users.docs.map((user) => UserModel.fromJson(user.data())).toList());
  }

  static Future<UserModel> getUser(String email) async {
    return await _users.where('email', isEqualTo: email).get().then((users) =>
        users.docs.length == 0
            ? null
            : UserModel.fromJson(users.docs[0].data()));
  }

  static deleteUser(UserModel user) async {
    var users = await _users.where('uid', isEqualTo: user.uid).get();
    var userRef =  users.docs[0].reference;

    await FirebaseFirestore.instance.runTransaction((transaction) async{
      transaction.delete(userRef);
    });
  }
}
