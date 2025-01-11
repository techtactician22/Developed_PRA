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
    Future deleteUserReport(String id )async{
      return FirebaseFirestore.instance.collection("N_Text_Rep").doc(id).delete();
    }
    Future updateData(String id) async {
  try {
    await FirebaseFirestore.instance
        .collection("N_Text_Rep") // Collection name
        .doc(id) // Document ID to update
        .update({"Status": "Resolved"}); // Correct key-value pair
    print("Document updated successfully!");
  } catch (e) {
    print("Error updating document: $e");
  }
}
  }

  class NDatabaseMethods {
  Future addImageReprts(
    Map<String, dynamic> imageReportMap, String id) async {
      return await FirebaseFirestore.instance
      .collection("Image_Rep")
      .doc(id)
      .set(imageReportMap);
    }
    Future<Stream<QuerySnapshot>> getImageReports() async{
      return FirebaseFirestore.instance.collection("Image_Rep").snapshots();
    }
    Future deleteUserReport(String id )async{
      return FirebaseFirestore.instance.collection("Image_Rep").doc(id).delete();
    }
     Future updateData(String id) async {
  try {
    await FirebaseFirestore.instance
        .collection("Image_Rep") // Collection name
        .doc(id) // Document ID to update
        .update({"Status": "Resolved"}); // Correct key-value pair
    print("Document updated successfully!");
  } catch (e) {
    print("Error updating document: $e");
  }
}

  }



