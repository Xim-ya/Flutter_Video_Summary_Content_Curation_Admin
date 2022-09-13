import 'package:dio/dio.dart';
import 'package:video_curation_admin/data/source/tmdb/tmdb_remote_data_source.dart';
import '../../utils/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // API
    Get.lazyPut(() => TmdbApi(Dio()), fenix: true);
    Get.lazyPut(() => TmdbRemoteDataSource(Get.find()), fenix: true);
  }
}
