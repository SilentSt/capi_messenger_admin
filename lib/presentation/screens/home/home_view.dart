import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';
import 'package:template/presentation/screens/home/home_vm.dart';
import 'package:template/presentation/screens/home/widgets/create_content.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(
        context.user.dashboardService,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              CupertinoButton(
                onPressed: () async {
                  final res = await context.global.errorService.showCallbackDialog(
                    builder: (context) {
                      return const CreateContent();
                    },
                  );
                },
                padding: EdgeInsets.zero,
                minSize: 0,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 20),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                AppTextButton(
                  onTap: () => App.router.navigate(const NewsViewRoute()),
                  text: 'Новости',
                  textStyle: AppTypography.sf.black.s26,
                ),
                AppTextButton(
                  onTap: () => App.router.navigate(const ProductsViewRoute()),
                  text: 'Продукты',
                  textStyle: AppTypography.sf.black.s26,
                ),
              ],
            ),
          ),
          body: PageView(children: const [
            AutoRouter(),
          ]),
        );
      },
    );
  }
}
