import 'package:video_curation_admin/domain/base/base_use_case.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/repository/tmdb/tmdb_repository.dart';
import 'package:video_curation_admin/utils/result.dart';

class LoadTvSearchedListUseCase
    extends BaseUseCase<String, Result<List<ContentModel>>> {
  LoadTvSearchedListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(String request) =>
      _repository.loadTvSearchList(request);
}
