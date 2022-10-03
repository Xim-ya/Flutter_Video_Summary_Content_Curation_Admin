import 'package:video_curation_admin/domain/model/content/channel_content_model.dart';

class MarkedRegisteredContentModel {
  final String contentId;
  final String type;

  MarkedRegisteredContentModel(this.contentId, this.type);

  factory MarkedRegisteredContentModel.fromChannelRegisterLayer(
      ChannelContentModel response) {
    return MarkedRegisteredContentModel(response.contentId, response.type!);
  }
}
