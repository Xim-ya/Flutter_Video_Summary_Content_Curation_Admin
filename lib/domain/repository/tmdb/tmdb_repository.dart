import 'package:video_curation_admin/data/source/tmdb/tmdb_remote_data_source.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';
import '../../../utils/result.dart';

class TmdbRepository {
  TmdbRepository(this._dataSource);

  final TmdbRemoteDataSource _dataSource;

  /* TMDB - 검색 결과 영화 리스트 */
  @override
  Future<Result<List<ContentModel>>> loadMovieSearchList(String query) async {
    try {
      final response = await _dataSource.loadMovieSearchList(query).then(
          (value) => value.results
              .map(ContentModel.fromMovieSearchListResponse)
              .toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
