import 'dart:developer';

import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:video_curation_admin/utils/index.dart';

class SearchContentViewModel extends BaseViewModel {
  SearchContentViewModel(this._loadMovieSearchedList);
  /* 전역 변수 및 객체 */
  /// Data Variables
  final Rxn<List<ContentModel>> contentSearchList = Rxn();

  /// State Variables
  final RxInt? selectedContentIndex = 0.obs;

  /* UseCase */
  final LoadMovieSearchedListUseCase _loadMovieSearchedList;

  /* 컨트롤러 */
  final TextEditingController contentSearchFormController =
      TextEditingController();

  /* Intent */
  /// UI Interaction Methods
  // 검색된 결과 리스트 아이템이 선택 되었을 때
  void onSearchItemTapped(int index) {
    loading(true);
    selectedContentIndex?.value = index;
    loading(false);
  }

  /// Newtworking Methods
  // 검색된 영화 리스트 호출
  Future<void> loadMovieSearchList() async {
    final responseResult =
        await _loadMovieSearchedList(contentSearchFormController.value.text);
    responseResult.fold(onSuccess: (data) {
      contentSearchList.value = data;
      print("호출 성공");
    }, onFailure: (err) {
      log(err.toString());
    });
  }
}
