import 'package:video_curation_admin/ui/common/widget/mapped_row_container.dart';
import 'package:video_curation_admin/ui/common/widget/outlined_text_form_field.dart';
import 'package:video_curation_admin/ui/common/widget/round_cached_img_container.dart';
import 'package:video_curation_admin/utils/index.dart';

class ChannelScreen extends BaseScreen<ChannelViewModel> {
  const ChannelScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print(vm.selectedContentInfo.value?.title ?? "제목 없음");
            },
            child: Text(
              "새로운 채널 등록하기",
              style: AppTextStyle.sectionTitle1,
            ),
          ),
          AppSpace.size28,
          /* Channel Id Input Form */
          OutlinedTextFormField(
              controller: vm.channelIdFormController,
              onSubmit: vm.onChannelIdSubmitted,
              hintText: "ex) UCuK80YHBZyyKrr2B1oHrgrw",
              labelText: '채널 ID'),
          AppSpace.size36,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "입력된 채널 정보",
                style: AppTextStyle.headline1,
              ),
              AppSpace.size16,
              const RoundCachedImgContainer(
                imgUrl:
                    'https://yt3.ggpht.com/ytc/AMLnZu9tKXzVPuAGTdZ-jfWmuDYRcZwKZlOm6GWpduKnvg=s240-c-k-c0x00ffffff-no-rj',
              ),
              AppSpace.size12,
              MappedRowContainer(
                title: "체널명",
                data: "어퍼컷",
              ),
              AppSpace.size8,
              MappedRowContainer(title: "채널 설명", data: "어퍼컷처럼 날카로운 미드와 영화 이야기"),
              AppSpace.size12,
              MappedRowContainer(title: "구독자 수", data: "${10000}명"),
            ],
          ),
          AppSpace.size36,
          Text(
            "추가 정보 입력",
            style: AppTextStyle.headline1,
          ),
          Obx(() => MappedRowContainer(
                title: "Favorite 설정",
                dataWidget: DropdownButton<String>(
                  value: vm.selectedDropDownValue.value,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) => vm.changeDropDownValue(value),
                  items: vm.dropDownValue
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )),
          AppSpace.size36,
          Row(
            children: [
              Text(
                "컨텐츠 등록",
                style: AppTextStyle.headline1,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.searchContent);
                  },
                  child: const Text("검색"))
            ],
          ),
          AppSpace.size16,
          vm.selectedContentInfo.value != null
              ? MappedRowContainer(
                  title: "제목", data: vm.selectedContentInfo.value!.title)
              : const SizedBox(),
        ],
      ),
    );
  }
}
