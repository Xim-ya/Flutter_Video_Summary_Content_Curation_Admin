import 'package:video_curation_admin/utils/index.dart';

@immutable
abstract class BaseScreen<T extends BaseViewModel> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    return buildScreen(context);
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  Widget buildScreen(BuildContext context);
}
