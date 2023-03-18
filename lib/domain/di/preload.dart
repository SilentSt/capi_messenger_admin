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

  ChopperClient get client => _client;

  LocalAuthDataSource get localAuthDS => _localAuthDS;

  @override
  Future<void> init(BuildContext context) async {
    _localAuthDS = LocalAuthDataSourceImpl();
    _client = ChopperClient(
      interceptors: [
        AuthInterceptor(_localAuthDS),
      ],
      baseUrl: Uri.parse(
          'http://capi.sbeusilent.space'), //TODO(whiskas4): change url
      converter: JsonMappableConverter(),
    );

    await _localAuthDS.init();
  }

  @override
  void dispose() {
    _localAuthDS.dispose();
  }
}
