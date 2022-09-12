import 'package:video_curation_admin/ui/screens/channel/searchContent/search_content_view_model.dart';
import 'package:video_curation_admin/utils/index.dart';

class SearchContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchContentViewModel(), fenix: true);
  }
}
