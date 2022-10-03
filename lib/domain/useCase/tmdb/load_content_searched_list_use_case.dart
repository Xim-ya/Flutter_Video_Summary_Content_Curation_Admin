import 'package:video_curation_admin/domain/base/base_two_param_use_case.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/repository/tmdb/tmdb_repository.dart';
import 'package:video_curation_admin/utils/index.dart';

class LoadContentSearchedListUseCase extends BaseTwoParamUseCase<List<bool>,
    String, Result<List<ContentModel>>> {
  LoadContentSearchedListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(
      List<bool> firstReq, String secondReq) {
    if (firstReq.first) {
      print("MOVIE SEARCH");
      return _repository.loadMovieSearchList(secondReq);
    } else {
      print("TV SEARCH");
      return _repository.loadTvSearchList(secondReq);
    }
  }
}
