import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/user_dependency.dart';

import 'news_vm.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      viewModelBuilder: () => NewsViewModel(context.user.dashboardService),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final item = viewModel.news[index];
            return Card(
              child: Text(
                item.title ?? '',
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: viewModel.news.length,
        );
      },
    );
  }
}
