class ChannelContentModel {
  final String contentId;
  final String title;
  late String? type;
  final List<String> youtubeVideoIdList;

  ChannelContentModel(
      {required this.contentId,
      required this.title,
      required this.youtubeVideoIdList,
      this.type});

  Map<String, dynamic> toJson() => {
        "contentId": contentId,
        "title": title,
        "type": type,
        "youtubeVideoIdList": youtubeVideoIdList,
      };
}
