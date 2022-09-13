import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/utils/index.dart';

class ChannelViewModel extends BaseViewModel {
  final db = FirebaseFirestore.instance;

  /* 전역변수 및 객체 */
  /// State Variables
  final List<String> dropDownValue = ["Yes", "Nop"];
  final RxString selectedDropDownValue = "Yes".obs;

  /// DataVariables
  final Rxn<ContentModel> selectedContentInfo = Rxn(null);

  /* 컨트롤러 */
  final TextEditingController channelIdFormController = TextEditingController();

  /* Intent */
  // Drop Down Option 변경
  void changeDropDownValue(String? option) {
    selectedDropDownValue.value = option!;
  }

  // 채널 ID가 Submit 되었을 때
  void onChannelIdSubmitted() {
    print(channelIdFormController.value.text);
  }

  // 채널 최초 등록
  Future<void> addNewChannel() async {
    Map<String, dynamic> jsonData = {"string": "tempData"};
    final docRef = db.collection("channels");
    docRef.doc("customId").set(jsonData);
  }

  static ChannelViewModel get to => Get.find();

  @override
  void onInit() {
    addNewChannel();
  }
}
