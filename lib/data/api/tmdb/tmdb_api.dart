import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:video_curation_admin/data/api/tmdb/response/tmdb_movie_response.dart';
import 'package:video_curation_admin/data/api/tmdb/response/tmdb_popular_drama_response.dart';

part 'tmdb_api.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class TmdbApi {
  factory TmdbApi(Dio dio, {String baseUrl}) = _TmdbApi;

  // '영화 컨텐츠 검색'
  @GET(
      '/search/movie?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1&query={query}')
  Future<TmdbMovieResponse> loadMovieSearchList(@Path('query') String query);

  // `인기 드라마` 호출
  @GET(
      '/search/tv?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1&query={query}')
  Future<TmdbPopularDramaResponse> loadTvSearchList(
      @Path('query') String query);
}
