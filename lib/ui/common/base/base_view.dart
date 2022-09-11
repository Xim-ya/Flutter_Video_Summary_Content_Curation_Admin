import 'package:video_curation_admin/utils/index.dart';

@immutable
abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  Widget buildView(BuildContext context);
}
