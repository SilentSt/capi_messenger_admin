import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';
import 'package:template/data/models/auth/session/session_result.dart';

@MappableClass()
class SessionModel extends CoreModel {
  SessionModel({
    required super.status,
    required super.code,
    required super.error,
    this.result = const [],
  });
  final List<SessionResult> result;
}
