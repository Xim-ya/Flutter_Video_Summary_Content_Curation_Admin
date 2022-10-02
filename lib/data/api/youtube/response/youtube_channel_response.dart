import 'package:video_curation_admin/data/api/youtube/response/youtube_thumbnail_info_response.dart';
import 'package:video_curation_admin/utils/index.dart';
part 'youtube_channel_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeChannelResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'pageInfo')
  Map<String, int> pageInfo;

  @JsonKey(name: 'items')
  List<YoutubeChannelDetailResponse> items;

  YoutubeChannelResponse(this.kind, this.etag, this.pageInfo, this.items);

  factory YoutubeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeStaticsResponse {
  @JsonKey(name: 'viewCount')
  final String viewCount;

  @JsonKey(name: 'subscriberCount')
  final String subscriberCount;

  @JsonKey(name: 'videoCount')
  final String videoCount;

  @JsonKey(name: 'hiddenSubscriberCount')
  final bool hiddenSubscriberCount;

  YoutubeStaticsResponse(this.viewCount, this.subscriberCount, this.videoCount,
      this.hiddenSubscriberCount);

  factory YoutubeStaticsResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeStaticsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeChannelDetailResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'snippet')
  YoutubeChannelSnippetResponse snippet;

  @JsonKey(name: "statistics")
  YoutubeStaticsResponse statics;

  YoutubeChannelDetailResponse(
      this.statics, this.kind, this.etag, this.id, this.snippet);

  factory YoutubeChannelDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelDetailResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeChannelSnippetResponse {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'thumbnails')
  YoutubeItemThumbnailInfoResponse thumbnails;

  @JsonKey(name: 'localized')
  Map<String, String>? localized;

  @JsonKey(name: 'country')
  String? country;

  YoutubeChannelSnippetResponse(this.title, this.description, this.publishedAt,
      this.thumbnails, this.localized, this.country);

  factory YoutubeChannelSnippetResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelSnippetResponseFromJson(json);
}
