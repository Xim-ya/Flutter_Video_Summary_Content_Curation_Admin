import 'package:cloud_firestore/cloud_firestore.dart';

class ChannelApi {
  final db = FirebaseFirestore.instance;

  // 채널 최초 등록
  Future<void> addNewChannel() async {
    Map<String, dynamic> jsonData = {"string": "tempData"};
    final docRef = db.collection("channels");
    docRef.doc("customId").set(jsonData);
  }
}
