import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:template/data/converters/json_mappable_converter.dart';
import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/local_auth_ds_impl.dart';
import 'package:template/data/interceptors/auth_interceptor.dart';

import 'core/app_dependency.dart';

class PreloadDependency extends AppDependency {
  PreloadDependency(super.context);

  late final LocalAuthDataSource _localAuthDS;
  late final ChopperClient _client;
  late final ChopperClient _authClient;

  ChopperClient get client => _client;
  ChopperClient get authClient => _authClient;

  LocalAuthDataSource get localAuthDS => _localAuthDS;

  @override
  Future<void> init(BuildContext context) async {
    _localAuthDS = LocalAuthDataSourceImpl();
    _client = ChopperClient(
      interceptors: [
        AuthInterceptor(_localAuthDS),
      ],
      baseUrl: Uri.parse(
        'http://capi.sbeusilent.space',
      ),
      converter: JsonMappableConverter(),
      errorConverter: JsonMappableConverter(),
    );
    _authClient = ChopperClient(
      interceptors: [
        AuthInterceptor(_localAuthDS),
      ],
      baseUrl: Uri.parse('https://auth.capi.shitposting.team/api/v1/'),
      converter: JsonMappableConverter(),
      errorConverter: JsonMappableConverter(),
    );
    await _localAuthDS.init();
  }

  @override
  void dispose() {
    _localAuthDS.dispose();
  }
}
