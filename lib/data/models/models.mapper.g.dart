import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'auth/session/device_model.dart';
import 'auth/session/session_model.dart';
import 'auth/session/session_result.dart';
import 'auth/sign_in/sign_in_dto.dart';
import 'auth/sign_in/sign_in_model.dart';
import 'auth/sign_in/sign_in_result.dart';
import 'auth/sign_up/sign_up_dto.dart';
import 'auth/sign_up/sign_up_model.dart';
import 'auth/verify/verify_dto.dart';
import 'auth/verify/verify_model.dart';
import 'core/core_error.dart';
import 'core/core_exception.dart';
import 'core/core_model.dart';
import 'core/core_status.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  CoreErrorMapper._(),
  CoreExceptionMapper._(),
  CoreModelMapper._(),
  SignInDtoMapper._(),
  SignInModelMapper._(),
  SignInResultMapper._(),
  SignUpDtoMapper._(),
  SignUpModelMapper._(),
  VerifyDtoMapper._(),
  VerifyModelMapper._(),
  DeviceModelMapper._(),
  SessionModelMapper._(),
  SessionResultMapper._(),
  CoreStatusMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class CoreErrorMapper extends BaseMapper<CoreError> {
  CoreErrorMapper._();

  @override Function get decoder => decode;
  CoreError decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreError fromMap(Map<String, dynamic> map) => CoreError(code: Mapper.i.$getOpt(map, 'code'), message: Mapper.i.$getOpt(map, 'message'), exception: Mapper.i.$getOpt(map, 'exception'));

  @override Function get encoder => (CoreError v) => encode(v);
  dynamic encode(CoreError v) => toMap(v);
  Map<String, dynamic> toMap(CoreError c) => {'code': Mapper.i.$enc(c.code, 'code'), 'message': Mapper.i.$enc(c.message, 'message'), 'exception': Mapper.i.$enc(c.exception, 'exception')};

  @override String stringify(CoreError self) => 'CoreError(code: ${Mapper.asString(self.code)}, message: ${Mapper.asString(self.message)}, exception: ${Mapper.asString(self.exception)})';
  @override int hash(CoreError self) => Mapper.hash(self.code) ^ Mapper.hash(self.message) ^ Mapper.hash(self.exception);
  @override bool equals(CoreError self, CoreError other) => Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.message, other.message) && Mapper.isEqual(self.exception, other.exception);

  @override Function get typeFactory => (f) => f<CoreError>();
}

extension CoreErrorMapperExtension  on CoreError {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreErrorCopyWith<CoreError> get copyWith => CoreErrorCopyWith(this, $identity);
}

abstract class CoreErrorCopyWith<$R> {
  factory CoreErrorCopyWith(CoreError value, Then<CoreError, $R> then) = _CoreErrorCopyWithImpl<$R>;
  CoreExceptionCopyWith<$R>? get exception;
  $R call({String? code, String? message, CoreException? exception});
  $R apply(CoreError Function(CoreError) transform);
}

class _CoreErrorCopyWithImpl<$R> extends BaseCopyWith<CoreError, $R> implements CoreErrorCopyWith<$R> {
  _CoreErrorCopyWithImpl(CoreError value, Then<CoreError, $R> then) : super(value, then);

  @override CoreExceptionCopyWith<$R>? get exception => $value.exception != null ? CoreExceptionCopyWith($value.exception!, (v) => call(exception: v)) : null;
  @override $R call({Object? code = $none, Object? message = $none, Object? exception = $none}) => $then(CoreError(code: or(code, $value.code), message: or(message, $value.message), exception: or(exception, $value.exception)));
}

class CoreExceptionMapper extends BaseMapper<CoreException> {
  CoreExceptionMapper._();

  @override Function get decoder => decode;
  CoreException decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreException fromMap(Map<String, dynamic> map) => CoreException(exception: Mapper.i.$getOpt(map, 'exception'), detail: Mapper.i.$getOpt(map, 'detail'), message: Mapper.i.$getOpt(map, 'message'));

  @override Function get encoder => (CoreException v) => encode(v);
  dynamic encode(CoreException v) => toMap(v);
  Map<String, dynamic> toMap(CoreException c) => {'exception': Mapper.i.$enc(c.exception, 'exception'), 'detail': Mapper.i.$enc(c.detail, 'detail'), 'message': Mapper.i.$enc(c.message, 'message')};

  @override String stringify(CoreException self) => 'CoreException(exception: ${Mapper.asString(self.exception)}, detail: ${Mapper.asString(self.detail)}, message: ${Mapper.asString(self.message)})';
  @override int hash(CoreException self) => Mapper.hash(self.exception) ^ Mapper.hash(self.detail) ^ Mapper.hash(self.message);
  @override bool equals(CoreException self, CoreException other) => Mapper.isEqual(self.exception, other.exception) && Mapper.isEqual(self.detail, other.detail) && Mapper.isEqual(self.message, other.message);

  @override Function get typeFactory => (f) => f<CoreException>();
}

extension CoreExceptionMapperExtension  on CoreException {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreExceptionCopyWith<CoreException> get copyWith => CoreExceptionCopyWith(this, $identity);
}

abstract class CoreExceptionCopyWith<$R> {
  factory CoreExceptionCopyWith(CoreException value, Then<CoreException, $R> then) = _CoreExceptionCopyWithImpl<$R>;
  $R call({String? exception, String? detail, String? message});
  $R apply(CoreException Function(CoreException) transform);
}

class _CoreExceptionCopyWithImpl<$R> extends BaseCopyWith<CoreException, $R> implements CoreExceptionCopyWith<$R> {
  _CoreExceptionCopyWithImpl(CoreException value, Then<CoreException, $R> then) : super(value, then);

  @override $R call({Object? exception = $none, Object? detail = $none, Object? message = $none}) => $then(CoreException(exception: or(exception, $value.exception), detail: or(detail, $value.detail), message: or(message, $value.message)));
}

class CoreModelMapper extends BaseMapper<CoreModel> {
  CoreModelMapper._();

  @override Function get decoder => decode;
  CoreModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreModel fromMap(Map<String, dynamic> map) => throw MapperException.missingConstructor('CoreModel');

  @override Function get encoder => (CoreModel v) => encode(v);
  dynamic encode(CoreModel v) {
    if (v is SignInModel) { return SignInModelMapper._().encode(v); }
    else if (v is SignUpModel) { return SignUpModelMapper._().encode(v); }
    else if (v is VerifyModel) { return VerifyModelMapper._().encode(v); }
    else if (v is SessionModel) { return SessionModelMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(CoreModel c) => {'status': Mapper.i.$enc(c.status, 'status'), 'code': Mapper.i.$enc(c.code, 'code'), 'error': Mapper.i.$enc(c.error, 'error')};

  @override String stringify(CoreModel self) => 'CoreModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)})';
  @override int hash(CoreModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error);
  @override bool equals(CoreModel self, CoreModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error);

  @override Function get typeFactory => (f) => f<CoreModel>();
}

extension CoreModelMapperExtension  on CoreModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class SignInDtoMapper extends BaseMapper<SignInDto> {
  SignInDtoMapper._();

  @override Function get decoder => decode;
  SignInDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInDto fromMap(Map<String, dynamic> map) => SignInDto(phone: Mapper.i.$get(map, 'phone'), password: Mapper.i.$get(map, 'password'));

  @override Function get encoder => (SignInDto v) => encode(v);
  dynamic encode(SignInDto v) => toMap(v);
  Map<String, dynamic> toMap(SignInDto s) => {'phone': Mapper.i.$enc(s.phone, 'phone'), 'password': Mapper.i.$enc(s.password, 'password')};

  @override String stringify(SignInDto self) => 'SignInDto(phone: ${Mapper.asString(self.phone)}, password: ${Mapper.asString(self.password)})';
  @override int hash(SignInDto self) => Mapper.hash(self.phone) ^ Mapper.hash(self.password);
  @override bool equals(SignInDto self, SignInDto other) => Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.password, other.password);

  @override Function get typeFactory => (f) => f<SignInDto>();
}

extension SignInDtoMapperExtension  on SignInDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInDtoCopyWith<SignInDto> get copyWith => SignInDtoCopyWith(this, $identity);
}

abstract class SignInDtoCopyWith<$R> {
  factory SignInDtoCopyWith(SignInDto value, Then<SignInDto, $R> then) = _SignInDtoCopyWithImpl<$R>;
  $R call({String? phone, String? password});
  $R apply(SignInDto Function(SignInDto) transform);
}

class _SignInDtoCopyWithImpl<$R> extends BaseCopyWith<SignInDto, $R> implements SignInDtoCopyWith<$R> {
  _SignInDtoCopyWithImpl(SignInDto value, Then<SignInDto, $R> then) : super(value, then);

  @override $R call({String? phone, String? password}) => $then(SignInDto(phone: phone ?? $value.phone, password: password ?? $value.password));
}

class SignInModelMapper extends BaseMapper<SignInModel> {
  SignInModelMapper._();

  @override Function get decoder => decode;
  SignInModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInModel fromMap(Map<String, dynamic> map) => SignInModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (SignInModel v) => encode(v);
  dynamic encode(SignInModel v) => toMap(v);
  Map<String, dynamic> toMap(SignInModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error'), 'result': Mapper.i.$enc(s.result, 'result')};

  @override String stringify(SignInModel self) => 'SignInModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(SignInModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(SignInModel self, SignInModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<SignInModel>();
}

extension SignInModelMapperExtension  on SignInModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInModelCopyWith<SignInModel> get copyWith => SignInModelCopyWith(this, $identity);
}

abstract class SignInModelCopyWith<$R> {
  factory SignInModelCopyWith(SignInModel value, Then<SignInModel, $R> then) = _SignInModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  SignInResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, SignInResult? result});
  $R apply(SignInModel Function(SignInModel) transform);
}

class _SignInModelCopyWithImpl<$R> extends BaseCopyWith<SignInModel, $R> implements SignInModelCopyWith<$R> {
  _SignInModelCopyWithImpl(SignInModel value, Then<SignInModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override SignInResultCopyWith<$R>? get result => $value.result != null ? SignInResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(SignInModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class SignInResultMapper extends BaseMapper<SignInResult> {
  SignInResultMapper._();

  @override Function get decoder => decode;
  SignInResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInResult fromMap(Map<String, dynamic> map) => SignInResult(session: Mapper.i.$getOpt(map, 'session'));

  @override Function get encoder => (SignInResult v) => encode(v);
  dynamic encode(SignInResult v) => toMap(v);
  Map<String, dynamic> toMap(SignInResult s) => {'session': Mapper.i.$enc(s.session, 'session')};

  @override String stringify(SignInResult self) => 'SignInResult(session: ${Mapper.asString(self.session)})';
  @override int hash(SignInResult self) => Mapper.hash(self.session);
  @override bool equals(SignInResult self, SignInResult other) => Mapper.isEqual(self.session, other.session);

  @override Function get typeFactory => (f) => f<SignInResult>();
}

extension SignInResultMapperExtension  on SignInResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInResultCopyWith<SignInResult> get copyWith => SignInResultCopyWith(this, $identity);
}

abstract class SignInResultCopyWith<$R> {
  factory SignInResultCopyWith(SignInResult value, Then<SignInResult, $R> then) = _SignInResultCopyWithImpl<$R>;
  $R call({String? session});
  $R apply(SignInResult Function(SignInResult) transform);
}

class _SignInResultCopyWithImpl<$R> extends BaseCopyWith<SignInResult, $R> implements SignInResultCopyWith<$R> {
  _SignInResultCopyWithImpl(SignInResult value, Then<SignInResult, $R> then) : super(value, then);

  @override $R call({Object? session = $none}) => $then(SignInResult(session: or(session, $value.session)));
}

class SignUpDtoMapper extends BaseMapper<SignUpDto> {
  SignUpDtoMapper._();

  @override Function get decoder => decode;
  SignUpDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpDto fromMap(Map<String, dynamic> map) => SignUpDto(login: Mapper.i.$get(map, 'login'), phone: Mapper.i.$get(map, 'phone'), firstName: Mapper.i.$get(map, 'first_name'), lastName: Mapper.i.$get(map, 'last_name'));

  @override Function get encoder => (SignUpDto v) => encode(v);
  dynamic encode(SignUpDto v) => toMap(v);
  Map<String, dynamic> toMap(SignUpDto s) => {'login': Mapper.i.$enc(s.login, 'login'), 'phone': Mapper.i.$enc(s.phone, 'phone'), 'first_name': Mapper.i.$enc(s.firstName, 'firstName'), 'last_name': Mapper.i.$enc(s.lastName, 'lastName')};

  @override String stringify(SignUpDto self) => 'SignUpDto(login: ${Mapper.asString(self.login)}, phone: ${Mapper.asString(self.phone)}, firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)})';
  @override int hash(SignUpDto self) => Mapper.hash(self.login) ^ Mapper.hash(self.phone) ^ Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName);
  @override bool equals(SignUpDto self, SignUpDto other) => Mapper.isEqual(self.login, other.login) && Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName);

  @override Function get typeFactory => (f) => f<SignUpDto>();
}

extension SignUpDtoMapperExtension  on SignUpDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpDtoCopyWith<SignUpDto> get copyWith => SignUpDtoCopyWith(this, $identity);
}

abstract class SignUpDtoCopyWith<$R> {
  factory SignUpDtoCopyWith(SignUpDto value, Then<SignUpDto, $R> then) = _SignUpDtoCopyWithImpl<$R>;
  $R call({String? login, String? phone, String? firstName, String? lastName});
  $R apply(SignUpDto Function(SignUpDto) transform);
}

class _SignUpDtoCopyWithImpl<$R> extends BaseCopyWith<SignUpDto, $R> implements SignUpDtoCopyWith<$R> {
  _SignUpDtoCopyWithImpl(SignUpDto value, Then<SignUpDto, $R> then) : super(value, then);

  @override $R call({String? login, String? phone, String? firstName, String? lastName}) => $then(SignUpDto(login: login ?? $value.login, phone: phone ?? $value.phone, firstName: firstName ?? $value.firstName, lastName: lastName ?? $value.lastName));
}

class SignUpModelMapper extends BaseMapper<SignUpModel> {
  SignUpModelMapper._();

  @override Function get decoder => decode;
  SignUpModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpModel fromMap(Map<String, dynamic> map) => SignUpModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'));

  @override Function get encoder => (SignUpModel v) => encode(v);
  dynamic encode(SignUpModel v) => toMap(v);
  Map<String, dynamic> toMap(SignUpModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error')};

  @override String stringify(SignUpModel self) => 'SignUpModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)})';
  @override int hash(SignUpModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error);
  @override bool equals(SignUpModel self, SignUpModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error);

  @override Function get typeFactory => (f) => f<SignUpModel>();
}

extension SignUpModelMapperExtension  on SignUpModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpModelCopyWith<SignUpModel> get copyWith => SignUpModelCopyWith(this, $identity);
}

abstract class SignUpModelCopyWith<$R> {
  factory SignUpModelCopyWith(SignUpModel value, Then<SignUpModel, $R> then) = _SignUpModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  $R call({bool? status, int? code, CoreError? error});
  $R apply(SignUpModel Function(SignUpModel) transform);
}

class _SignUpModelCopyWithImpl<$R> extends BaseCopyWith<SignUpModel, $R> implements SignUpModelCopyWith<$R> {
  _SignUpModelCopyWithImpl(SignUpModel value, Then<SignUpModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none}) => $then(SignUpModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error)));
}

class VerifyDtoMapper extends BaseMapper<VerifyDto> {
  VerifyDtoMapper._();

  @override Function get decoder => decode;
  VerifyDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  VerifyDto fromMap(Map<String, dynamic> map) => VerifyDto(sessionId: Mapper.i.$get(map, 'session_id'), code: Mapper.i.$get(map, 'code'));

  @override Function get encoder => (VerifyDto v) => encode(v);
  dynamic encode(VerifyDto v) => toMap(v);
  Map<String, dynamic> toMap(VerifyDto v) => {'session_id': Mapper.i.$enc(v.sessionId, 'sessionId'), 'code': Mapper.i.$enc(v.code, 'code')};

  @override String stringify(VerifyDto self) => 'VerifyDto(sessionId: ${Mapper.asString(self.sessionId)}, code: ${Mapper.asString(self.code)})';
  @override int hash(VerifyDto self) => Mapper.hash(self.sessionId) ^ Mapper.hash(self.code);
  @override bool equals(VerifyDto self, VerifyDto other) => Mapper.isEqual(self.sessionId, other.sessionId) && Mapper.isEqual(self.code, other.code);

  @override Function get typeFactory => (f) => f<VerifyDto>();
}

extension VerifyDtoMapperExtension  on VerifyDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  VerifyDtoCopyWith<VerifyDto> get copyWith => VerifyDtoCopyWith(this, $identity);
}

abstract class VerifyDtoCopyWith<$R> {
  factory VerifyDtoCopyWith(VerifyDto value, Then<VerifyDto, $R> then) = _VerifyDtoCopyWithImpl<$R>;
  $R call({String? sessionId, String? code});
  $R apply(VerifyDto Function(VerifyDto) transform);
}

class _VerifyDtoCopyWithImpl<$R> extends BaseCopyWith<VerifyDto, $R> implements VerifyDtoCopyWith<$R> {
  _VerifyDtoCopyWithImpl(VerifyDto value, Then<VerifyDto, $R> then) : super(value, then);

  @override $R call({String? sessionId, String? code}) => $then(VerifyDto(sessionId: sessionId ?? $value.sessionId, code: code ?? $value.code));
}

class VerifyModelMapper extends BaseMapper<VerifyModel> {
  VerifyModelMapper._();

  @override Function get decoder => decode;
  VerifyModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  VerifyModel fromMap(Map<String, dynamic> map) => VerifyModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), accessToken: Mapper.i.$getOpt(map, 'access_token'), tokenType: Mapper.i.$getOpt(map, 'token_type'), userUuid: Mapper.i.$getOpt(map, 'user_uuid'));

  @override Function get encoder => (VerifyModel v) => encode(v);
  dynamic encode(VerifyModel v) => toMap(v);
  Map<String, dynamic> toMap(VerifyModel v) => {'status': Mapper.i.$enc(v.status, 'status'), 'code': Mapper.i.$enc(v.code, 'code'), 'error': Mapper.i.$enc(v.error, 'error'), 'access_token': Mapper.i.$enc(v.accessToken, 'accessToken'), 'token_type': Mapper.i.$enc(v.tokenType, 'tokenType'), 'user_uuid': Mapper.i.$enc(v.userUuid, 'userUuid')};

  @override String stringify(VerifyModel self) => 'VerifyModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, accessToken: ${Mapper.asString(self.accessToken)}, tokenType: ${Mapper.asString(self.tokenType)}, userUuid: ${Mapper.asString(self.userUuid)})';
  @override int hash(VerifyModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.accessToken) ^ Mapper.hash(self.tokenType) ^ Mapper.hash(self.userUuid);
  @override bool equals(VerifyModel self, VerifyModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.accessToken, other.accessToken) && Mapper.isEqual(self.tokenType, other.tokenType) && Mapper.isEqual(self.userUuid, other.userUuid);

  @override Function get typeFactory => (f) => f<VerifyModel>();
}

extension VerifyModelMapperExtension  on VerifyModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  VerifyModelCopyWith<VerifyModel> get copyWith => VerifyModelCopyWith(this, $identity);
}

abstract class VerifyModelCopyWith<$R> {
  factory VerifyModelCopyWith(VerifyModel value, Then<VerifyModel, $R> then) = _VerifyModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  $R call({bool? status, int? code, CoreError? error, String? accessToken, String? tokenType, String? userUuid});
  $R apply(VerifyModel Function(VerifyModel) transform);
}

class _VerifyModelCopyWithImpl<$R> extends BaseCopyWith<VerifyModel, $R> implements VerifyModelCopyWith<$R> {
  _VerifyModelCopyWithImpl(VerifyModel value, Then<VerifyModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? accessToken = $none, Object? tokenType = $none, Object? userUuid = $none}) => $then(VerifyModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), accessToken: or(accessToken, $value.accessToken), tokenType: or(tokenType, $value.tokenType), userUuid: or(userUuid, $value.userUuid)));
}

class DeviceModelMapper extends BaseMapper<DeviceModel> {
  DeviceModelMapper._();

  @override Function get decoder => decode;
  DeviceModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DeviceModel fromMap(Map<String, dynamic> map) => DeviceModel(uuid: Mapper.i.$getOpt(map, 'uuid'), deviceFamily: Mapper.i.$getOpt(map, 'device_family'), osVersion: Mapper.i.$getOpt(map, 'os_version'), browserVersion: Mapper.i.$getOpt(map, 'browser_version'), country: Mapper.i.$getOpt(map, 'country'), deviceType: Mapper.i.$getOpt(map, 'device_type'), osFamily: Mapper.i.$getOpt(map, 'os_family'), deviceBrand: Mapper.i.$getOpt(map, 'device_brand'), browserFamily: Mapper.i.$getOpt(map, 'browser_family'), ip: Mapper.i.$getOpt(map, 'ip'), city: Mapper.i.$getOpt(map, 'city'));

  @override Function get encoder => (DeviceModel v) => encode(v);
  dynamic encode(DeviceModel v) => toMap(v);
  Map<String, dynamic> toMap(DeviceModel d) => {'uuid': Mapper.i.$enc(d.uuid, 'uuid'), 'device_family': Mapper.i.$enc(d.deviceFamily, 'deviceFamily'), 'os_version': Mapper.i.$enc(d.osVersion, 'osVersion'), 'browser_version': Mapper.i.$enc(d.browserVersion, 'browserVersion'), 'country': Mapper.i.$enc(d.country, 'country'), 'device_type': Mapper.i.$enc(d.deviceType, 'deviceType'), 'os_family': Mapper.i.$enc(d.osFamily, 'osFamily'), 'device_brand': Mapper.i.$enc(d.deviceBrand, 'deviceBrand'), 'browser_family': Mapper.i.$enc(d.browserFamily, 'browserFamily'), 'ip': Mapper.i.$enc(d.ip, 'ip'), 'city': Mapper.i.$enc(d.city, 'city')};

  @override String stringify(DeviceModel self) => 'DeviceModel(uuid: ${Mapper.asString(self.uuid)}, deviceFamily: ${Mapper.asString(self.deviceFamily)}, osVersion: ${Mapper.asString(self.osVersion)}, browserVersion: ${Mapper.asString(self.browserVersion)}, country: ${Mapper.asString(self.country)}, deviceType: ${Mapper.asString(self.deviceType)}, osFamily: ${Mapper.asString(self.osFamily)}, deviceBrand: ${Mapper.asString(self.deviceBrand)}, browserFamily: ${Mapper.asString(self.browserFamily)}, ip: ${Mapper.asString(self.ip)}, city: ${Mapper.asString(self.city)})';
  @override int hash(DeviceModel self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.deviceFamily) ^ Mapper.hash(self.osVersion) ^ Mapper.hash(self.browserVersion) ^ Mapper.hash(self.country) ^ Mapper.hash(self.deviceType) ^ Mapper.hash(self.osFamily) ^ Mapper.hash(self.deviceBrand) ^ Mapper.hash(self.browserFamily) ^ Mapper.hash(self.ip) ^ Mapper.hash(self.city);
  @override bool equals(DeviceModel self, DeviceModel other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.deviceFamily, other.deviceFamily) && Mapper.isEqual(self.osVersion, other.osVersion) && Mapper.isEqual(self.browserVersion, other.browserVersion) && Mapper.isEqual(self.country, other.country) && Mapper.isEqual(self.deviceType, other.deviceType) && Mapper.isEqual(self.osFamily, other.osFamily) && Mapper.isEqual(self.deviceBrand, other.deviceBrand) && Mapper.isEqual(self.browserFamily, other.browserFamily) && Mapper.isEqual(self.ip, other.ip) && Mapper.isEqual(self.city, other.city);

  @override Function get typeFactory => (f) => f<DeviceModel>();
}

extension DeviceModelMapperExtension  on DeviceModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DeviceModelCopyWith<DeviceModel> get copyWith => DeviceModelCopyWith(this, $identity);
}

abstract class DeviceModelCopyWith<$R> {
  factory DeviceModelCopyWith(DeviceModel value, Then<DeviceModel, $R> then) = _DeviceModelCopyWithImpl<$R>;
  $R call({String? uuid, String? deviceFamily, String? osVersion, String? browserVersion, String? country, String? deviceType, String? osFamily, String? deviceBrand, String? browserFamily, String? ip, String? city});
  $R apply(DeviceModel Function(DeviceModel) transform);
}

class _DeviceModelCopyWithImpl<$R> extends BaseCopyWith<DeviceModel, $R> implements DeviceModelCopyWith<$R> {
  _DeviceModelCopyWithImpl(DeviceModel value, Then<DeviceModel, $R> then) : super(value, then);

  @override $R call({Object? uuid = $none, Object? deviceFamily = $none, Object? osVersion = $none, Object? browserVersion = $none, Object? country = $none, Object? deviceType = $none, Object? osFamily = $none, Object? deviceBrand = $none, Object? browserFamily = $none, Object? ip = $none, Object? city = $none}) => $then(DeviceModel(uuid: or(uuid, $value.uuid), deviceFamily: or(deviceFamily, $value.deviceFamily), osVersion: or(osVersion, $value.osVersion), browserVersion: or(browserVersion, $value.browserVersion), country: or(country, $value.country), deviceType: or(deviceType, $value.deviceType), osFamily: or(osFamily, $value.osFamily), deviceBrand: or(deviceBrand, $value.deviceBrand), browserFamily: or(browserFamily, $value.browserFamily), ip: or(ip, $value.ip), city: or(city, $value.city)));
}

class SessionModelMapper extends BaseMapper<SessionModel> {
  SessionModelMapper._();

  @override Function get decoder => decode;
  SessionModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SessionModel fromMap(Map<String, dynamic> map) => SessionModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (SessionModel v) => encode(v);
  dynamic encode(SessionModel v) => toMap(v);
  Map<String, dynamic> toMap(SessionModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error'), 'result': Mapper.i.$enc(s.result, 'result')};

  @override String stringify(SessionModel self) => 'SessionModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(SessionModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(SessionModel self, SessionModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<SessionModel>();
}

extension SessionModelMapperExtension  on SessionModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SessionModelCopyWith<SessionModel> get copyWith => SessionModelCopyWith(this, $identity);
}

abstract class SessionModelCopyWith<$R> {
  factory SessionModelCopyWith(SessionModel value, Then<SessionModel, $R> then) = _SessionModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, SessionResult, SessionResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<SessionResult>? result});
  $R apply(SessionModel Function(SessionModel) transform);
}

class _SessionModelCopyWithImpl<$R> extends BaseCopyWith<SessionModel, $R> implements SessionModelCopyWith<$R> {
  _SessionModelCopyWithImpl(SessionModel value, Then<SessionModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, SessionResult, SessionResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => SessionResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<SessionResult>? result}) => $then(SessionModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class SessionResultMapper extends BaseMapper<SessionResult> {
  SessionResultMapper._();

  @override Function get decoder => decode;
  SessionResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SessionResult fromMap(Map<String, dynamic> map) => SessionResult(status: Mapper.i.$getOpt(map, 'status'), uuid: Mapper.i.$getOpt(map, 'uuid'), device: Mapper.i.$getOpt(map, 'device'));

  @override Function get encoder => (SessionResult v) => encode(v);
  dynamic encode(SessionResult v) => toMap(v);
  Map<String, dynamic> toMap(SessionResult s) => {'status': Mapper.i.$enc(s.status, 'status'), 'uuid': Mapper.i.$enc(s.uuid, 'uuid'), 'device': Mapper.i.$enc(s.device, 'device')};

  @override String stringify(SessionResult self) => 'SessionResult(status: ${Mapper.asString(self.status)}, uuid: ${Mapper.asString(self.uuid)}, device: ${Mapper.asString(self.device)})';
  @override int hash(SessionResult self) => Mapper.hash(self.status) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.device);
  @override bool equals(SessionResult self, SessionResult other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.device, other.device);

  @override Function get typeFactory => (f) => f<SessionResult>();
}

extension SessionResultMapperExtension  on SessionResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SessionResultCopyWith<SessionResult> get copyWith => SessionResultCopyWith(this, $identity);
}

abstract class SessionResultCopyWith<$R> {
  factory SessionResultCopyWith(SessionResult value, Then<SessionResult, $R> then) = _SessionResultCopyWithImpl<$R>;
  CoreStatusCopyWith<$R>? get status;
  DeviceModelCopyWith<$R>? get device;
  $R call({CoreStatus? status, String? uuid, DeviceModel? device});
  $R apply(SessionResult Function(SessionResult) transform);
}

class _SessionResultCopyWithImpl<$R> extends BaseCopyWith<SessionResult, $R> implements SessionResultCopyWith<$R> {
  _SessionResultCopyWithImpl(SessionResult value, Then<SessionResult, $R> then) : super(value, then);

  @override CoreStatusCopyWith<$R>? get status => $value.status != null ? CoreStatusCopyWith($value.status!, (v) => call(status: v)) : null;
  @override DeviceModelCopyWith<$R>? get device => $value.device != null ? DeviceModelCopyWith($value.device!, (v) => call(device: v)) : null;
  @override $R call({Object? status = $none, Object? uuid = $none, Object? device = $none}) => $then(SessionResult(status: or(status, $value.status), uuid: or(uuid, $value.uuid), device: or(device, $value.device)));
}

class CoreStatusMapper extends BaseMapper<CoreStatus> {
  CoreStatusMapper._();

  @override Function get decoder => decode;
  CoreStatus decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreStatus fromMap(Map<String, dynamic> map) => CoreStatus(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$getOpt(map, 'title'));

  @override Function get encoder => (CoreStatus v) => encode(v);
  dynamic encode(CoreStatus v) => toMap(v);
  Map<String, dynamic> toMap(CoreStatus c) => {'id': Mapper.i.$enc(c.id, 'id'), 'title': Mapper.i.$enc(c.title, 'title')};

  @override String stringify(CoreStatus self) => 'CoreStatus(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)})';
  @override int hash(CoreStatus self) => Mapper.hash(self.id) ^ Mapper.hash(self.title);
  @override bool equals(CoreStatus self, CoreStatus other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<CoreStatus>();
}

extension CoreStatusMapperExtension  on CoreStatus {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreStatusCopyWith<CoreStatus> get copyWith => CoreStatusCopyWith(this, $identity);
}

abstract class CoreStatusCopyWith<$R> {
  factory CoreStatusCopyWith(CoreStatus value, Then<CoreStatus, $R> then) = _CoreStatusCopyWithImpl<$R>;
  $R call({int? id, String? title});
  $R apply(CoreStatus Function(CoreStatus) transform);
}

class _CoreStatusCopyWithImpl<$R> extends BaseCopyWith<CoreStatus, $R> implements CoreStatusCopyWith<$R> {
  _CoreStatusCopyWithImpl(CoreStatus value, Then<CoreStatus, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? title = $none}) => $then(CoreStatus(id: or(id, $value.id), title: or(title, $value.title)));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
