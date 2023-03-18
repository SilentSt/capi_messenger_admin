import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class SignUpDto with Mappable {
  SignUpDto({
    required this.token,
  });

  final String token;
}
