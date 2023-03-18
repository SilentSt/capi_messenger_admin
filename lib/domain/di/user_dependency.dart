import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/preload.dart';

class UserDependency extends AppDependency {
  UserDependency(super.context);

  late final GlobalDependency _globalDependency;

  @override
  Future<void> init(BuildContext context) async {
    _globalDependency = context.read<GlobalDependency>();
    final preloadDepenpency = context.read<PreloadDependency>();    
  }

  @override
  void dispose() {}
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
