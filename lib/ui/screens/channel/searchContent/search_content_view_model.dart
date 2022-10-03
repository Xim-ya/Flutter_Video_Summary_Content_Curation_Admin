import 'dart:developer';

import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_content_searched_list_use_case.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_tv_searched_list_use_case.dart';
import 'package:video_curation_admin/utils/index.dart';

class SearchContentViewModel extends BaseViewModel {
  SearchContentViewModel(this._loadMovieSearchedList, this._loadTvSearchedList,
      this._loadContentSearchedListUseCase);

  /* 전역 변수 및 객체 */

  /// Data Variables
  final Rxn<List<ContentModel>> contentSearchList = Rxn();

  /// State Variables
  final RxInt? selectedContentIndex = 0.obs;
  final RxList<bool> contentTypeOptions = [true, false].obs; // Movie <--> TV

  /* UseCase */
  final LoadMovieSearchedListUseCase _loadMovieSearchedList;
  final LoadTvSearchedListUseCase _loadTvSearchedList;
  final LoadContentSearchedListUseCase _loadContentSearchedListUseCase;

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

  // 호출 컨텐츠 타입 설정 (Movie or TV)
  void toggleContentTypeOption(int index) {
    for (int buttonIndex = 0;
        buttonIndex < contentTypeOptions.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        contentTypeOptions[buttonIndex] = true;
      } else {
        contentTypeOptions[buttonIndex] = false;
      }
    }
  }

  // 선택된 영화 정보를 ChannelVM에 속해는 변수에 저장
  void passMovieDataPassedLayer() {
    final ContentModel content =
        contentSearchList.value![selectedContentIndex!.value];
    content.type = "movie";

    ChannelViewModel.to.registeredContentList.add(content);
    Get.back();
  }

  /// Newtworking Methods

  // 선택된 컨텐츠 타입에 따라 영화 or TV 컨텐츠 리스트 호출
  Future<void> loadContentSearchedList() async {
    final responseResult = await _loadContentSearchedListUseCase(
        contentTypeOptions, contentSearchFormController.value.text);
    responseResult.fold(onSuccess: (data) {
      contentSearchList.value = data;
      print("호출 성공");
    }, onFailure: (err) {
      log(err.toString());
    });
  }

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
