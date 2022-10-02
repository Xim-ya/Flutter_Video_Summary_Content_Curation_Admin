import 'package:video_curation_admin/ui/common/base/base_view.dart';

import '../../../../utils/index.dart';

class AddYoutubeIdDialog extends BaseView<ChannelViewModel> {
  final int registeredContentIndex;
  const AddYoutubeIdDialog({Key? key, required this.registeredContentIndex})
      : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Youtube Video Id 리스트 입력",
              style: AppTextStyle.headline3,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: vm.youtubeVideoIdFormController,
                decoration: InputDecoration(
                    hintText: "ex) sBcbqRgBH7E, w_95H0JRQOQ, ....",
                    suffixIcon: IconButton(
                      onPressed: () {
                        vm.onYoutubeVideoIdListSubmitted(
                            registeredContentIndex);
                      },
                      icon: Icon(Icons.send),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
