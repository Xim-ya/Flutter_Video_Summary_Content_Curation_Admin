import 'package:video_curation_admin/utils/index.dart';
import 'package:video_curation_admin/utils/resources/fonts.dart';
import 'package:video_curation_admin/utils/resources/space.dart';

class ChannelScreen extends BaseScreen<ChannelViewModel> {
  const ChannelScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "새로운 채널 등록하기",
            style: AppTextStyle.sectionTitle1,
          ),
          AppSpace.size28,
          Row(
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).dividerColor),
                    ),
                    hintText: "ex) UCuK80YHBZyyKrr2B1oHrgrw",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    labelText: '채널 ID',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: child),
            ],
          )
        ],
      ),
    );
  }
}
