import 'package:video_curation_admin/data/api/channel/channel_api.dart';
import 'package:video_curation_admin/domain/model/channel/channelModel.dart';
import 'package:video_curation_admin/utils/index.dart';

class ChannelRepository {
  ChannelRepository(this._api);

  final ChannelApi _api;

  Future<Result<void>> registerNewChannel(ChannelModel channelInfo) async {
    try {
      return Result.success(_api.registerNewChannel(channelInfo));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
