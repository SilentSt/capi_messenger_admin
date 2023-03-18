// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_auth_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteAuthDataSource extends RemoteAuthDataSource {
  _$RemoteAuthDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteAuthDataSource;

  @override
  Future<Response<dynamic>> signIn(
    String phone,
    String password,
  ) {
    final Uri $url = Uri.parse('auth/login');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'phone',
        phone,
      ),
      PartValue<String>(
        'password',
        password,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: FormUrlEncodedConverter.requestFactory,
    );
  }

  @override
  Future<Response<dynamic>> verify({
    required String code,
    required String session,
  }) {
    final Uri $url = Uri.parse('auth/login/verify');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'code',
        code,
      ),
      PartValue<String>(
        'session_id',
        session,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: FormUrlEncodedConverter.requestFactory,
    );
  }

  @override
  Future<Response<dynamic>> signUp(dynamic dto) {
    final Uri $url = Uri.parse('auth/register');
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> me() {
    final Uri $url = Uri.parse('auth/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sessions() {
    final Uri $url = Uri.parse('auth/sessions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
