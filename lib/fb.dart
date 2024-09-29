import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseOpt{
  final _ref = FirebaseFirestore.instance.collection('users');

  Future<void> addNotes(String Notes) async{
    _ref.doc(FirebaseAuth.instance.currentUser?.uid)
    .collection("users")
    .add({
      "Notes" : Notes,
      "Time" : DateTime.now(),
    });
  }

  Stream<QuerySnapshot> readAllData(){
    return _ref.doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("users")
        .snapshots();
  }



}

