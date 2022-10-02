import 'package:video_curation_admin/domain/base/base_use_case.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/repository/tmdb/tmdb_repository.dart';
import 'package:video_curation_admin/utils/result.dart';

class LoadMovieSearchedListUseCase
    extends BaseUseCase<String, Result<List<ContentModel>>> {
  LoadMovieSearchedListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(String request) =>
      _repository.loadMovieSearchList(request);
}
