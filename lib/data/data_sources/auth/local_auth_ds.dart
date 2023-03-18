import 'package:flutter/material.dart';
import 'package:template/data/models/models.dart';

enum AuthState {
  authorized,
  none,
}

abstract class LocalAuthDataSource extends ChangeNotifier {
  final sessionKey = 'session_key';
  final loginDtoStorageKey = 'login_key';

  final ValueNotifier<String?> currentToken = ValueNotifier(
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzX3Rva2VuIiwiZXhwIjoxNzEwNjM1NDc2LCJpYXQiOjE2NzkwOTk0NzYsInN1YiI6IjA2MzUxMmIzLWViODctNzBkZS04MDAwLWIzZDMyNDE0ZDlhYiIsInNlc3Npb24iOiIwNjQxNTA1ZC03YWNlLTdiZGEtODAwMC0zMzFhYTI5OWE1M2IifQ.wBCjy2x8PTOAwMx4Ax1wvY-ix-0R45ufBdlacUAgY2M',
  );
  final ValueNotifier<SignInDto?> currentLoginDto = ValueNotifier(null);

  Future<void> init();

  Future<void> storeSession(String token);

  Future<void> storeLoginDto(SignInDto dto);

  Future<void> restoreSession();

  Future<void> restoreLoginDto();

  Future<void> logout();

  @override
  void dispose() {
    currentToken.dispose();
    currentLoginDto.dispose();
    super.dispose();
  }
}
