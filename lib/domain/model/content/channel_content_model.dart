class ChannelContentModel {
  final String contentId;
  final String title;
  final List<String> youtubeVideoIdList;

  ChannelContentModel(
      {required this.contentId,
      required this.title,
      required this.youtubeVideoIdList});

  Map<String, dynamic> toJson() => {
        "contentId": contentId,
        "title": title,
        "youtubeVideoIdList": ["23", "234", '234'],
      };
}
