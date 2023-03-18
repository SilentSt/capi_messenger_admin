import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/local_auth_ds_impl.dart';
import 'package:template/data/data_sources/auth/remote_auth_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';

import 'core/app_service.dart';

class AuthService extends AppService {
  AuthService(
    this._lds,
    this._rds,
    super.errorService,
  );
  final LocalAuthDataSource _lds;
  final RemoteAuthDataSource _rds;

  SignInDto? get savedUser => _lds.currentLoginDto.value;

  @override
  Future<void> init() async {
    LocalAuthDataSourceImpl.currentState.addListener(authListener);
    await _lds.init();
  }

  Future<void> authListener() async {
    if (LocalAuthDataSourceImpl.currentState.value == AuthState.none) {
      App.router.pushAndPopUntil(
        const AuthViewRoute(),
        predicate: (_) => false,
      );
    } else {
      App.router.pushAndPopUntil(
        const RootViewRoute(),
        predicate: (_) => false,
      );
    }
  }

  Future<void> signin({required SignInDto dto, bool saveData = false}) async {
    final res = await _rds.signIn(dto);
    if (!res.isSuccessful || res.body?.token == null) {
      await dialogService.showError();
      return;
    }
    if (saveData) {
      await _lds.storeLoginDto(dto);
    }
    await _lds.storeSession(res.body!.token);
  }

  Future<void> signup(SignUpDto dto) async {
    final res = await _rds.signUp(dto);
    if (!res.isSuccessful || res.body?.token == null) {
      await dialogService.showError();
      return;
    }
    await _lds.storeSession(res.body!.token);
  }

  Future<void> logout() async {
    await _lds.logout();
  }

  @override
  void dispose() {
    _lds.dispose();
  }
}
