import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/presentation/screens/home/home_vm.dart';
import 'package:template/presentation/screens/home/widgets/news_widget.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
              child: Column(
            children: [
              AppTextButton(
                onTap: () {
                  NewsWidget;
                },
                text: 'Новости',
                textStyle: AppTypography.sf.black.s26,
              ),
              AppTextButton(
                onTap: () {
                  // return ProductWidget;
                },
                text: 'Продукты',
                textStyle: AppTypography.sf.black.s26,
              ),
            ],
          )),
          body: PageView(children: const [
            NewsWidget(),
          ]),
        );
      },
    );
  }
}
