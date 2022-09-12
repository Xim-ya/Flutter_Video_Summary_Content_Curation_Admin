import 'package:video_curation_admin/utils/index.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const TabsScreen(),
      binding: TabsBinding(),
    )
  ];
}
