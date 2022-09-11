import 'package:video_curation_admin/utils/index.dart';

class RootViewModel extends BaseViewModel {
  /* 전역 변수 및 객체 */
  int selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;
}
