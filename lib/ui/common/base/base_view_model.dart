import 'package:video_curation_admin/utils/index.dart';

abstract class BaseViewModel extends GetxController {
  final loading = false.obs;

  void refreshData() => {};
}
