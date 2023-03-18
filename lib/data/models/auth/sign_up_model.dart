import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class SignUpModel with Mappable {
  SignUpModel({
    required this.token,
  });

  final String token;
}
