import 'package:dio/dio.dart';
import 'package:video_curation_admin/data/api/channel/channel_api.dart';
import 'package:video_curation_admin/data/api/youtube/youtube_api.dart';
import '../../utils/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // API
    Get.lazyPut(() => TmdbApi(Dio()), fenix: true);
    Get.lazyPut(() => YoutubeApi(Get.find()), fenix: true);
    Get.lazyPut(() => Dio(), fenix: true);
    Get.lazyPut(() => ChannelApi(), fenix: true);
  }
}
