import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class CreateContent extends StatefulWidget {
  const CreateContent({Key? key}) : super(key: key);

  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController content = TextEditingController();
  XFile? image;
  Uint8List? bytes;

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    content.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final res = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (res == null) return;
    bytes = await res.readAsBytes();
    setState(() {
      image = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Создание'),
          const SizedBox(height: 20),
          if (bytes != null)
            Image.memory(bytes!)
          else
            CupertinoButton(
              onPressed: pickImage,
              padding: EdgeInsets.zero,
              minSize: 0,
              child: const Icon(Icons.add),
            ),
          const SizedBox(height: 20),
          AppTextField(controller: title),
          const SizedBox(height: 20),
          AppTextField(controller: description),
          const SizedBox(height: 20),
          StatefulBuilder(
            builder: (context, upd) {
              content.addListener(() {
                upd(() {});
              });
              return SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: content,
                        minLines: 5,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Контент',
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                      height: double.infinity,
                      child: ColoredBox(color: ColorName.black),
                    ),
                    SingleChildScrollView(
                      child: Expanded(
                        child: MarkdownBody(
                          data: content.text,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
