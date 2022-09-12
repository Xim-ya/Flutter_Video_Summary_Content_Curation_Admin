import 'package:video_curation_admin/utils/index.dart';

class ChannelViewModel extends BaseViewModel {
  final tempData = "aim";

  final db = FirebaseFirestore.instance;

  // 채널 최초 등록
  Future<void> addNewChannel() async {
    Map<String, dynamic> jsonData = {"string": "tempData"};
    final docRef = db.collection("channels");
    docRef.doc("customId").set(jsonData);
  }

  @override
  void onInit() {
    addNewChannel();
  }
}