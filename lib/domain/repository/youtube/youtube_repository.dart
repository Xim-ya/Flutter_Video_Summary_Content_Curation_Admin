import 'package:video_curation_admin/data/api/youtube/youtube_api.dart';
import 'package:video_curation_admin/domain/model/channel/channelModel.dart';

import '../../../utils/index.dart';

class YoutubeRepository {
  YoutubeRepository(this._youtubeApi);

  final YoutubeApi _youtubeApi;

  Future<Result<ChannelModel>> loadYoutubeChannelInfo(String channelId) async {
    try {
      final response = await _youtubeApi.loadYoutubeChannel(channelId);
      return Result.success(ChannelModel.fromResponse(response));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
