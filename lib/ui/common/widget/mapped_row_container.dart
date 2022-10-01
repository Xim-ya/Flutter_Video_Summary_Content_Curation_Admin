import 'package:video_curation_admin/utils/index.dart';

class MappedRowContainer extends StatelessWidget {
  const MappedRowContainer(
      {Key? key, required this.title, this.data, this.dataWidget})
      : super(key: key);

  final String title;
  final String? data;
  final Widget? dataWidget;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: AppTextStyle.body1,
            ),
            AppSpace.size14,
            dataWidget == null
                ? Text(
                    data ?? "데이터 입력 오류",
                    style: AppTextStyle.body2.copyWith(color: Colors.blue),
                  )
                : dataWidget!,
          ],
        ),
      );
}
