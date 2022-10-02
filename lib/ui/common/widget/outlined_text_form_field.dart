import 'package:video_curation_admin/utils/index.dart';

class OutlinedTextFormField extends StatelessWidget {
  const OutlinedTextFormField({
    Key? key,
    this.fieldWidth,
    required this.onSubmit,
    required this.hintText,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final double? fieldWidth;
  final VoidCallback onSubmit;
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: fieldWidth ?? 500,
        child: TextField(
          controller: controller,
          onSubmitted: (String _) {
            onSubmit();
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
            suffixIcon:
                GestureDetector(onTap: onSubmit, child: const Icon(Icons.send)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      );
}
