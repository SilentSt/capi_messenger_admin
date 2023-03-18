import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/auth/auth_vm.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class SignUpWidget extends ViewModelWidget<AuthViewModel> {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorName.lightGrey.withOpacity(.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              text:
                  viewModel.session == null ? 'Получить код' : 'Проверить код',
              buttonColor: ColorName.blue,
            ),
          ],
        ),
      ),
    );
  }
}
