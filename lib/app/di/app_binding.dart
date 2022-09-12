import 'package:video_curation_admin/app/modules/data_modules.dart';
import 'package:video_curation_admin/app/modules/domain_modules.dart';
import 'package:video_curation_admin/utils/index.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    DomainModules.dependencies();
    DataModules.dependencies();

    Get.put(TabsViewModel(), permanent: true);
    Get.lazyPut(() => ChannelViewModel(), fenix: true);
  }
}
