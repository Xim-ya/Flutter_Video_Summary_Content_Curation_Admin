import 'package:video_curation_admin/ui/screens/channel/searchContent/search_content_binding.dart';
import 'package:video_curation_admin/ui/screens/channel/searchContent/search_content_screen.dart';
import 'package:video_curation_admin/utils/index.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: Routes.tabs,
        page: () => const TabsScreen(),
        binding: TabsBinding(),
        children: [
          GetPage(
              name: Routes.searchContent,
              page: () => const SearchContentScreen(),
              binding: SearchContentBinding())
        ]),
  ];
}
