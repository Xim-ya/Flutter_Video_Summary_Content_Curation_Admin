import 'package:video_curation_admin/data/api/youtube/response/youtube_channel_response.dart';
import 'package:video_curation_admin/domain/model/content/channel_content_model.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';

class ChannelModel {
  final String id;
  final String name;
  final String subscribers;
  final String videoCount;
  final String viewCount;
  final String description;
  final String thumbnailUrl;
  late bool? isFavorite;
  late List<ChannelContentModel>? contents;

  ChannelModel({
    required this.id,
    required this.name,
    required this.subscribers,
    required this.videoCount,
    required this.description,
    required this.viewCount,
    required this.thumbnailUrl,
    this.isFavorite,
    this.contents,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "subscribers": subscribers,
        "thumbnailUrl": thumbnailUrl,
        "viewCount": viewCount,
        "contents": contents!.map((e) => ChannelContentModel(
                contentId: e.contentId,
                title: e.title,
                youtubeVideoIdList: e.youtubeVideoIdList)
            .toJson()),
      };

  factory ChannelModel.fromResponse(YoutubeChannelResponse response) {
    final responseItem = response.items[0];

    return ChannelModel(
        id: responseItem.id,
        viewCount: responseItem.statics.viewCount,
        thumbnailUrl: responseItem.snippet.thumbnails.medium.url!,
        name: responseItem.snippet.title,
        subscribers: responseItem.statics.subscriberCount,
        videoCount: responseItem.statics.videoCount,
        contents: null,
        isFavorite: null,
        description: responseItem.snippet.description ?? "채널 설명 없음");
  }
}
