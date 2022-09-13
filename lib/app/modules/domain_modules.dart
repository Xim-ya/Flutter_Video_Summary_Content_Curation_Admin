import 'package:video_curation_admin/domain/repository/tmdb/tmdb_repository.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';

import '../../utils/index.dart';

abstract class DomainModules {
  static void dependencies() {
    Get.lazyPut(() => LoadMovieSearchedListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbRepository(Get.find()), fenix: true);
  }
}
