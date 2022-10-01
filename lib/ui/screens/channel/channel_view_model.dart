import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:video_curation_admin/ui/screens/channel/localWidget/add_youtube_id_dialog.dart';
import 'package:video_curation_admin/utils/index.dart';

class ChannelViewModel extends BaseViewModel {
  final db = FirebaseFirestore.instance;

  /* 전역변수 및 객체 */

  /// State Variables
  final List<String> isFavoriteOptions = ["Yes", "Nop"];
  final List<String> contentTypeOptions = ["notSelected", "movie", "tv"];
  final RxString selectedFavoriteOption = "Yes".obs;
  final RxBool tempState = false.obs;
  final RxList<ContentModel> _registeredContentList = <ContentModel>[].obs;
  final RxInt testNum = 0.obs;

  /// DataVariables
  final Rxn<ContentModel> selectedContentInfo = Rxn();

  /* 컨트롤러 */
  final TextEditingController channelIdFormController = TextEditingController();
  final TextEditingController contentSearchFormController =
      TextEditingController();

  /* Intent */
  // Drop Down Option 변경
  void changeDropDownValue(String? option) {
    selectedFavoriteOption.value = option!;
  }

  // 채널 ID가 Submit 되었을 때
  void onChannelIdSubmitted() {
    print(channelIdFormController.value.text);
  }

  void openYoutubeIdInsertDialog() {
    Get.dialog(const AddYoutubeIdDialog());
  }

  void onContentTypeChanged({required String option, required int index}) {
    final ContentModel content = _registeredContentList[index];
    content.type = option;
    _registeredContentList.value[index] = content;
  }

  // 채널 최초 등록
  Future<void> addNewChannel() async {
    Map<String, dynamic> jsonData = {"string": "tempData"};
    final docRef = db.collection("channels");
    docRef.doc("customId").set(jsonData);
  }

  // 캡슐화
  static ChannelViewModel get to => Get.find();

  List<ContentModel> get registeredContentList => _registeredContentList;

  @override
  void onInit() {
    addNewChannel();
  }
}
