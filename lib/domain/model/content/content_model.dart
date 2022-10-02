import 'package:video_curation_admin/data/api/tmdb/response/tmdb_movie_item_response.dart';

class ContentModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String? overview;
  final String? releaseDate;
  final num voteAverage;
  final List<int>? genreIds;
  late String? type;
  late List<String>? youtubeVideoIds; // custom

  ContentModel({
    this.type,
    required this.adult,
    required this.backDropUrl,
    required this.posterUrl,
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    this.youtubeVideoIds,
  });

  // TMDB 영화 검색 정보 API
  factory ContentModel.fromMovieSearchListResponse(
          TmdbMovieItemResponse response) =>
      ContentModel(
        adult: response.adult,
        id: response.id,
        title: response.title,
        overview: response.overview,
        releaseDate: response.release_date,
        voteAverage: response.vote_average,
        backDropUrl: response.backdrop_path,
        posterUrl: response.poster_path,
        genreIds: response.genre_ids,
        youtubeVideoIds: null,
        type: null,
      );
}
