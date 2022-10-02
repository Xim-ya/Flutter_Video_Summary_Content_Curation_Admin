import 'package:video_curation_admin/domain/model/content/content_model.dart';
import 'package:video_curation_admin/ui/common/widget/outlined_text_form_field.dart';
import 'package:video_curation_admin/ui/screens/channel/searchContent/search_content_view_model.dart';
import 'package:video_curation_admin/utils/index.dart';

class SearchContentScreen extends BaseScreen<SearchContentViewModel> {
  const SearchContentScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("컨텐츠 검색"),
        actions: [
          IconButton(
              onPressed: vm.passMovieDataPassedLayer,
              icon: const Icon(Icons.save))
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              OutlinedTextFormField(
                onSubmit: vm.loadMovieSearchList,
                hintText: "ex) 어벤져스",
                labelText: "컨텐츠 검색",
                controller: vm.contentSearchFormController,
              ),
              AppSpace.size36,
              Expanded(
                child: Obx(() => vm.contentSearchList.value != null &&
                        vm.loading.isFalse &&
                        vm.contentSearchList.value!.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: vm.contentSearchList.value!.length,
                        separatorBuilder: (context, index) => AppSpace.size14,
                        itemBuilder: (context, index) {
                          final ContentModel item =
                              vm.contentSearchList.value![index];
                          return Center(
                            child: GestureDetector(
                              onTap: () => vm.onSearchItemTapped(index),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: vm.selectedContentIndex != null &&
                                            index ==
                                                vm.selectedContentIndex?.value
                                        ? Colors.grey.withOpacity(0.2)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                width: 500,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 100,
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/w500${item.posterUrl}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Text(
                                      item.title,
                                      style: AppTextStyle.body2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : const Text("검색된 결과 없음")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
