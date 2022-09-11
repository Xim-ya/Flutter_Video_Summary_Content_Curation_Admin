import 'package:video_curation_admin/app/routes/app_routes.dart';
import 'package:video_curation_admin/ui/screens/root/root_binding.dart';
import 'package:video_curation_admin/utils/index.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const RootScreen(),
      binding: RootBinding(),
    )
  ];
}
