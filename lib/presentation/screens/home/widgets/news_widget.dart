import 'package:flutter/material.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_text_button.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final controller = TextEditingController();

  List<Widget> _items = [];

  void _addNews() {
    setState(
      () {
        _items.add(_news());
      },
    );
  }

  Widget _news() {
    return Card(
        child: Column(
      children: [
        ListTile(
          onTap: () {},
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller,
              style: AppTypography.sf.s16.w500.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: 'Ввод...',
                hintStyle: AppTypography.sf.s15.w400.black,
              ),
              maxLines: 5,
              minLines: 1,
              onChanged: (value) {
                // data = value;
              },
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppTextButton(
            onTap: _addNews,
            text: '+',
            textStyle: AppTypography.sf.black.s26,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return _items[index];
              }),
        )
      ],
    );
  }
}
