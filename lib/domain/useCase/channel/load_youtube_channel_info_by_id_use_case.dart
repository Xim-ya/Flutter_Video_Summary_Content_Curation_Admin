import 'package:video_curation_admin/domain/base/base_use_case.dart';
import 'package:video_curation_admin/domain/model/channel/channelModel.dart';
import 'package:video_curation_admin/domain/repository/youtube/youtube_repository.dart';
import 'package:video_curation_admin/utils/index.dart';

class LoadYoutubeChannelInfoById
    extends BaseUseCase<String, Result<ChannelModel>> {
  LoadYoutubeChannelInfoById(this._repository);

  final YoutubeRepository _repository;

  @override
  Future<Result<ChannelModel>> call(String request) =>
      _repository.loadYoutubeChannelInfo(request);
}
