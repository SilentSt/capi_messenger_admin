import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/auth/auth_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class SignInWidget extends ViewModelWidget<AuthViewModel> {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: viewModel.phoneController,
              title: 'Телефон',
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: viewModel.passwordController,
              obscure: true,
              title: 'Пароль',
            ),
            if (viewModel.session != null) ...[
              const SizedBox(height: 10),
              AppTextField(
                controller: viewModel.codeController,
                title: 'Код',
              ),
            ],
            const SizedBox(height: 20),
            AppButton(
              onTap: viewModel.session == null
                  ? viewModel.signIn
                  : viewModel.verify,
              text: viewModel.session == null
                  ? 'Получить код'
                  : 'Проверить код',
              buttonColor: ColorName.blue,
              textStyle: AppTypography.sf.white.s16.w600,
            ),
          ],
        ),
      ),
    );
  }
}
