import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/ui/common/widget/mapped_row_container.dart';
import 'package:video_curation_admin/ui/common/widget/outlined_text_form_field.dart';
import 'package:video_curation_admin/ui/common/widget/circle_cached_img_container.dart';
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
              const CircleCachedImgContainer(
                imgUrl:
                    'https://yt3.ggpht.com/ytc/AMLnZu9tKXzVPuAGTdZ-jfWmuDYRcZwKZlOm6GWpduKnvg=s240-c-k-c0x00ffffff-no-rj',
              ),
              AppSpace.size12,
              MappedRowContainer(
                title: "체널명",
                data: "어퍼컷",
              ),
              MappedRowContainer(title: "채널 설명", data: "어퍼컷처럼 날카로운 미드와 영화 이야기"),
              MappedRowContainer(title: "구독자 수", data: "${10000}명"),
            ],
          ),
          AppSpace.size36,
          Text(
            "추가 정보 입력",
            style: AppTextStyle.headline1,
          ),
          Obx(
            () => MappedRowContainer(
              title: "Favorite 설정",
              dataWidget: DropdownButton<String>(
                value: vm.selectedFavoriteOption.value,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) => vm.changeDropDownValue(value),
                items: vm.isFavoriteOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          AppSpace.size36,
          Row(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {},
                  child: Text(
                    "컨텐츠 등록 (${vm.registeredContentList.length}개)",
                    style: AppTextStyle.headline1,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.searchContent);
                  },
                  child: const Text("추가"))
            ],
          ),
          Obx(() => vm.registeredContentList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.registeredContentList.length,
                  itemBuilder: (context, index) {
                    final ContentModel item = vm.registeredContentList[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MappedRowContainer(title: "제목", data: item.title),
                            MappedRowContainer(
                                title: "컨텐츠 ID", data: item.id.toString()),
                            MappedRowContainer(title: "타입", data: item.type),
                            Row(
                              children: <Widget>[
                                MappedRowContainer(
                                    title:
                                        "VideoId 리스트 (${item.youtubeVideoIds?.length ?? 0}개)",
                                    data: item.youtubeVideoIds.toString()),
                                IconButton(
                                    onPressed: vm.openYoutubeIdInsertDialog,
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_forever)),
                      ],
                    );
                  })
              : Text("No REGISTERED CONTENTS")),
          AppSpace.size16,
        ],
      ),
    );
  }
}
