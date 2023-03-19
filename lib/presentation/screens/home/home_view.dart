import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';
import 'package:template/presentation/screens/home/home_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(
        context.user.dashboardService,
        context.global.uploadService,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextButton(
                        onTap: () => App.router.navigate(const NewsViewRoute()),
                        text: 'Новости',
                        textStyle: AppTypography.sf.black.s26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextButton(
                        onTap: () =>
                            App.router.navigate(const ProductsViewRoute()),
                        text: 'Продукты',
                        textStyle: AppTypography.sf.black.s26,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 50,
                    child: AppButton(
                      onTap: context.global.authService.logout,
                      buttonColor: ColorName.red,
                      text: 'Выйти',
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: PageView(
            children: const [
              AutoRouter(),
            ],
          ),
        );
      },
    );
  }
}
