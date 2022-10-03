import 'package:video_curation_admin/domain/repository/channel/channel_repository.dart';
import 'package:video_curation_admin/domain/repository/tmdb/tmdb_repository.dart';
import 'package:video_curation_admin/domain/repository/youtube/youtube_repository.dart';
import 'package:video_curation_admin/domain/useCase/channel/load_youtube_channel_info_by_id_use_case.dart';
import 'package:video_curation_admin/domain/useCase/channel/register_new_channel_use_case.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_content_searched_list_use_case.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_tv_searched_list_use_case.dart';

import '../../utils/index.dart';

abstract class DomainModules {
  static void dependencies() {
    Get.lazyPut(() => LoadMovieSearchedListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbRepository(Get.find()), fenix: true);
    Get.lazyPut(() => YoutubeRepository(Get.find()));
    Get.lazyPut(() => LoadYoutubeChannelInfoById(Get.find()));
    Get.lazyPut(() => RegisterNewChannel(Get.find()), fenix: true);
    Get.lazyPut(() => ChannelRepository(Get.find()), fenix: true);
    Get.lazyPut(() => LoadTvSearchedListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => LoadContentSearchedListUseCase(Get.find()), fenix: true);
  }
}
