import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addTextReprts(
    Map<String, dynamic> textReportMap, String id) async {
      return await FirebaseFirestore.instance
      .collection("N_Text_Rep")
      .doc(id)
      .set(textReportMap);
    }
    Future<Stream<QuerySnapshot>> getTextReports() async{
      return FirebaseFirestore.instance.collection("N_Text_Rep").snapshots();
    }
  }



