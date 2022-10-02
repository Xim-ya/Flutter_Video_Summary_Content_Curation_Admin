import 'dart:developer';

import 'package:video_curation_admin/domain/model/channel/channelModel.dart';
import 'package:video_curation_admin/domain/model/content/channel_content_model.dart';
import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/useCase/channel/load_youtube_channel_info_by_id.dart';
import 'package:video_curation_admin/domain/useCase/channel/register_new_channel.dart';
import 'package:video_curation_admin/ui/screens/channel/localWidget/add_youtube_id_dialog.dart';
import 'package:video_curation_admin/utils/index.dart';

class ChannelViewModel extends BaseViewModel {
  ChannelViewModel(this._loadYoutubeChannelInfoById, this._registerNewChannel);

  final db = FirebaseFirestore.instance;

  /* 전역변수 및 객체 */

  /// State Variables
  final List<String> isFavoriteOptions = ["Yes", "Nop"];
  final RxString selectedFavoriteOption = "Yes".obs;

  /// DataVariables
  final Rxn<ContentModel> selectedContentInfo = Rxn();
  final RxList<ContentModel> _registeredContentList = <ContentModel>[].obs;
  final Rxn<ChannelModel> _registeredChannel = Rxn();

  /* UseCase */
  final LoadYoutubeChannelInfoById _loadYoutubeChannelInfoById;
  final RegisterNewChannel _registerNewChannel;

  /* Controller */
  final TextEditingController channelIdFormController = TextEditingController();
  late TextEditingController youtubeVideoIdFormController =
      TextEditingController();

  /* Intent */
  // 등록된 개별 content에 Youtube Id Video List 데이터 입력
  void onYoutubeVideoIdListSubmitted(int index) {
    // Text Inputs 포맷
    final String inputs = youtubeVideoIdFormController.value.text;
    final String whiteSpaceRemovedInputs = inputs.replaceAll(" ", "");
    final List<String> splitIdList = whiteSpaceRemovedInputs.split(",");

    // 컨텐츠 `youtubeVideoIds` 값 업데이트 (추가)
    final ContentModel content = _registeredContentList[index];
    content.youtubeVideoIds = splitIdList;
    _registeredContentList[index] = content;

    // TextField 초기화
    youtubeVideoIdFormController.clear();

    Get.back();
  }

  // Firebase Db에 새로운 채널 등록
  Future<void> registerNewChannel() async {
    final channelInfo = _registeredChannel.value;

    List<ChannelContentModel> channelContents = _registeredContentList
        .map((e) => ChannelContentModel(
            contentId: e.id.toString(),
            title: e.title,
            youtubeVideoIdList: e.youtubeVideoIds!))
        .toList();

    channelInfo!.isFavorite =
        selectedFavoriteOption.value == "Yes" ? true : false;

    channelInfo.contents = channelContents;

    final responseResult = await _registerNewChannel.call(channelInfo);
    responseResult.fold(onSuccess: (data) {
      print("등록 성공");
    }, onFailure: (e) {
      print("호출 실패!");
    });
  }

  // Drop Down Option 변경
  void changeDropDownValue(String? option) {
    selectedFavoriteOption.value = option!;
  }

  // 채널 ID가 Submit 되었을 때
  void onChannelIdSubmitted() {
    loadYoutubeChannelInfo();
  }

  // 등록된 컨텐츠에 Youtube Id를 입력하는 Dialog 호출
  void openYoutubeIdInsertDialog(int index) {
    Get.dialog(AddYoutubeIdDialog(registeredContentIndex: index));
  }

  Future<void> loadYoutubeChannelInfo() async {
    final responseResult = await _loadYoutubeChannelInfoById
        .call(channelIdFormController.value.text);
    responseResult.fold(
      onSuccess: (data) {
        _registeredChannel.value = data;
        print(data);
      },
      onFailure: (e) {
        log(e.toString());
      },
    );
  }

  // 캡슐화
  static ChannelViewModel get to => Get.find();

  List<ContentModel> get registeredContentList => _registeredContentList;

  ChannelModel? get registeredChannel => _registeredChannel.value;

  @override
  void onInit() {}
}
