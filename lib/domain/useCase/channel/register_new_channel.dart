import 'package:video_curation_admin/domain/base/base_use_case.dart';
import 'package:video_curation_admin/domain/model/channel/channelModel.dart';
import 'package:video_curation_admin/domain/repository/channel/channel_repository.dart';
import 'package:video_curation_admin/utils/index.dart';

class RegisterNewChannel extends BaseUseCase<ChannelModel, Result<void>> {
  RegisterNewChannel(this._repository);

  final ChannelRepository _repository;

  @override
  Future<Result<void>> call(ChannelModel request) =>
      _repository.registerNewChannel(request);
}
