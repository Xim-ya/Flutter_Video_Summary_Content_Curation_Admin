import 'package:video_curation_admin/utils/index.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TabsViewModel(), permanent: true);
    Get.lazyPut(() => ChannelViewModel(Get.find(), Get.find()), fenix: true);
  }
}
