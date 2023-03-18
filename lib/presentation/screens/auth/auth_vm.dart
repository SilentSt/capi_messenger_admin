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
  final TextEditingController loginController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final PageController stateController = PageController();

  bool saveData = false;
  String? session;

  Future<void> onReady() async {
    phoneController.text = authService.savedUser?.phone ?? '';
    passwordController.text = authService.savedUser?.password ?? '';
  }

  Future<void> signIn() async {
    setBusy(true);
    session = await authService.signin(
      dto: SignInDto(
        phone: phoneController.text,
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

  Future<void> signUp() async {
    setBusy(true);
    await authService.signup(
      SignUpDto(
        login: loginController.text,
        phone: phoneController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
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
    stateController.dispose();
    super.dispose();
  }
}
