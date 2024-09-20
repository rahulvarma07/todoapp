import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOpt{
  final _ref = FirebaseFirestore.instance.collection('users');

  Future<void> addNotes(String Task, String Note) async{
    _ref.add({
      "Task" : Task,
      "Note" : Note,
      "Time" : DateTime.now(),
    });
  }

}

