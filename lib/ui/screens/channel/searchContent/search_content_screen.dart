import 'package:video_curation_admin/ui/common/widget/outlined_text_form_field.dart';
import 'package:video_curation_admin/ui/screens/channel/searchContent/search_content_view_model.dart';
import 'package:video_curation_admin/utils/index.dart';

class SearchContentScreen extends BaseScreen<SearchContentViewModel> {
  const SearchContentScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("컨텐츠 검색"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              OutlinedTextFormField(
                onSubmit: () {},
                hintText: "ex) 어벤져스",
                labelText: "컨텐츠 검색",
                controller: vm.contentSearchFormController,
              ),
              AppSpace.size36,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    const String posterUrl = "/1OdA3gOq8N5KWwXsZhYVHbeyx8l.jpg";
                    return Center(
                      child: SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500$posterUrl",
                                imageBuilder: (context, imageProvider) =>
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
                              "어벤져스",
                              style: AppTextStyle.body2,
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
