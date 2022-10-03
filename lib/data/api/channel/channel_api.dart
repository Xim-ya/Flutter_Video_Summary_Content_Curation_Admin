import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_curation_admin/domain/model/channel/channelModel.dart';
import 'package:video_curation_admin/domain/model/content/channel_content_model.dart';

class ChannelApi {
  final db = FirebaseFirestore.instance;

  // 채널 최초 등록
  Future<void> addNewChannel() async {
    Map<String, dynamic> jsonData = {"string": "tempData"};
    final docRef = db.collection("channels");
    docRef.doc("customId").set(jsonData);
  }

  // 채널 최초 등록
  Future<void> registerNewChannel(ChannelModel channelInfo) async {
    final docRef = db.collection("channels");

    // contents json array object 포맷
    final List<Map<String, dynamic>> nestedList = channelInfo.contents!
        .map((e) => ChannelContentModel(
                contentId: e.contentId,
                title: e.title,
                youtubeVideoIdList: e.youtubeVideoIdList)
            .toJson())
        .toList();

    Map<String, dynamic> jsonData = {
      "name": channelInfo.name,
      "description": channelInfo.description,
      "subscribers": channelInfo.subscribers,
      "thumbnailUrl": channelInfo.thumbnailUrl,
      "viewCount": channelInfo.viewCount,
      "isFavorite": channelInfo.isFavorite,
      "contents": nestedList,
    };
    docRef.doc(channelInfo.id).set(jsonData);
  }
}
