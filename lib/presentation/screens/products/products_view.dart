import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/home/widgets/create_content.dart';
import 'package:template/presentation/theme/app_typography.dart';

import 'products_vm.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
      viewModelBuilder: () => ProductsViewModel(
        context.user.dashboardService,
        context.global.uploadService,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Column(
          children: [
            CupertinoButton(
              onPressed: () => context.global.errorService.showCallbackDialog(
                builder: (context) {
                  return CreateContent(create: viewModel.create);
                },
              ),
              padding: const EdgeInsets.all(8),
              minSize: 0,
              color: ColorName.blue,
              child: Text(
                'Добавить',
                style: AppTypography.sf.white.s20.w600,
              ),
            ),
            const SizedBox(height: 50),
            if (viewModel.products.isEmpty)
              const Text(
                'Нет созданных продуктов',
              )
            else
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.products[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.previewLink != null)
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: item.previewLink!,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: CupertinoButton(
                                    onPressed: () => viewModel.delete(item.id),
                                    minSize: 0,
                                    color: ColorName.white,
                                    padding: const EdgeInsets.all(12),
                                    child: const Icon(
                                      Icons.close,
                                      color: ColorName.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              item.title ?? '',
                              style: AppTypography.sf.s24.w600.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              item.description ?? '',
                              style: AppTypography.sf.s18.w600.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: MarkdownBody(
                              data: item.content ?? '',
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
