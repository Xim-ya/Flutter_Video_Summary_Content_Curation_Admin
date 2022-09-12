import 'package:video_curation_admin/utils/index.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TabsViewModel(), permanent: true);
    Get.lazyPut(() => ChannelViewModel(), fenix: true);
  }
}
