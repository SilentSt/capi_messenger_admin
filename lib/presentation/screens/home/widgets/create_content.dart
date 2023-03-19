import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_text_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class CreateContent extends StatefulWidget {
  const CreateContent({Key? key, required this.create}) : super(key: key);

  final Function({
    required String title,
    required String description,
    required String content,
    required XFile file,
  }) create;

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
      child: SizedBox(
        width: 450,
        height: MediaQuery.of(context).size.height*.7,
        child: ListView(
          children: [
            const Text('Создание'),
            const SizedBox(
              height: 20,
            ),
            if (bytes != null)
              SizedBox(
                width: 400,
                height: 400,
                child: InkWell(
                  onTap: pickImage,
                  child: Image.memory(bytes!),
                ),
              )
            else
              CupertinoButton(
                onPressed: pickImage,
                padding: EdgeInsets.zero,
                minSize: 0,
                child: const Icon(Icons.add),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                controller: title,
                hint: 'Название',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                controller: description,
                hint: 'Описание',
              ),
            ),
            const SizedBox(height: 20),
            StatefulBuilder(
              builder: (context, upd) {
                content.addListener(() {
                  upd(() {});
                });
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
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
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            child: SingleChildScrollView(
                              child: MarkdownBody(
                                data: content.text,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AppTextButton(
                    onTap: () {
                      if (image == null) return;

                      widget.create(
                        content: content.text,
                        title: title.text.trim(),
                        description: description.text.trim(),
                        file: image!,
                      );
                      Navigator.pop(context);
                    },
                    text: 'Сохранить',
                    textStyle: AppTypography.sf.green.s20.w500,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppTextButton(
                    onTap: () => Navigator.pop(context),
                    text: 'Отмена',
                    textStyle: AppTypography.sf.red.s20.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
