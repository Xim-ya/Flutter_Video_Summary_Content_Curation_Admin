import 'package:video_curation_admin/utils/index.dart';
part 'tmdb_movie_response.g.dart';

@JsonSerializable(createToJson: false)
class TmdbMovieResponse {
  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'results')
  List<TmdbMovieItemResponse> results;

  TmdbMovieResponse(this.page, this.results);

  factory TmdbMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbMovieResponseFromJson(json);
}
