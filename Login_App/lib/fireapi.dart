import 'package:cloud_firestore/cloud_firestore.dart';

class FireApi {
  static final instance = FirebaseFirestore.instance;

  static tokenCheck({required String code}) async {
    bool isPresent = false;
    DocumentSnapshot doc =
        await instance.collection("invitation").doc("codes").get();
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    if (map.containsKey("codes")) {
      List codes = map["codes"] ?? [];
      for (var element in codes) {
        if (element.toString().toLowerCase().trim() ==
            code.toLowerCase().trim()) {
          isPresent = true;
        }
      }
    }
    return isPresent;
  }
}
