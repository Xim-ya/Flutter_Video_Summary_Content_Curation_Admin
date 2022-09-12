import 'package:video_curation_admin/utils/index.dart';

class RootViewModel extends BaseViewModel {
  /* 전역 변수 및 객체 */
  RxInt selectedIndex = 0.obs;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  /* Intent */
  // Navigation Rail Item이 클릭 되었을 때
  void onNavItemTapped(int index) {
    selectedIndex.value = index;
  }
}
