import 'package:video_curation_admin/data/api/tmdb/response/tmdb_movie_response.dart';
import 'package:video_curation_admin/utils/index.dart';

class TmdbRemoteDataSource {
  TmdbRemoteDataSource(this._api);

  final TmdbApi _api;

  /* TMDB - 영화 검색 결과 리스트 호출 */
  Future<TmdbMovieResponse> loadMovieSearchList(String query) =>
      _api.loadMovieSearchList(query);
}
