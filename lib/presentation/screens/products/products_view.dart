import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/user_dependency.dart';

import 'products_vm.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
      viewModelBuilder: () => ProductsViewModel(context.user.dashboardService),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final item = viewModel.products[index];
            return Card(
              child: Text(
                item.title ?? '',
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: viewModel.products.length,
        );
      },
    );
  }
}
