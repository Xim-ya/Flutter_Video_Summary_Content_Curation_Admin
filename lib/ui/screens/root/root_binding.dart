import 'package:video_curation_admin/utils/index.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootViewModel(), permanent: true);
  }
}
