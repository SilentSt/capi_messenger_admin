import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/auth/auth.dart';
import 'package:template/domain/services/auth_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel({
    required this.authService,
  });

  final AuthService authService;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool saveData = false;
  String? session;

  Future<void> onReady() async {
    phoneController.text = authService.savedUser?.phone ?? '';
    passwordController.text = authService.savedUser?.password ?? '';
  }

  Future<void> signIn() async {
    setBusy(true);
    String phone = phoneController.text.trim();

    if (phone.startsWith('8')) {
      phone = phone.replaceFirst('8', '+7');
    }
    session = await authService.signin(
      dto: SignInDto(
        phone: phone,
        password: passwordController.text,
      ),
    );
    setBusy(false);
  }

  Future<void> verify() async {
    if (session == null) return;
    setBusy(true);
    await authService.verify(
      dto: VerifyDto(
        sessionId: session!,
        code: codeController.text,
      ),
    );
    setBusy(false);
  }

  void swapDataSave(bool? value) {
    saveData = value ?? saveData;
    notifyListeners();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
