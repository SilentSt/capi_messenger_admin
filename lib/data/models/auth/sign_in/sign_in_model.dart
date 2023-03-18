import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class SignInModel extends CoreModel {
  SignInModel({
    required super.status,
    required super.code,
    required super.error,
    this.result,
  });
  final SignInResult? result;
}
