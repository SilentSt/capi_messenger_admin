import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class SignInModel with Mappable {
  SignInModel({
    required this.token,
  });

  final String token;
}
