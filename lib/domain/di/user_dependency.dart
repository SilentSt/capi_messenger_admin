import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/data_sources/push/remote_push_ds.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/preload.dart';
import 'package:template/domain/services/push_notifications_service.dart';

class UserDependency extends AppDependency {
  UserDependency(super.context);

  late final GlobalDependency _globalDependency;
  late final PushNotificationsService _pushNotificationsService;

  @override
  Future<void> init(BuildContext context) async {
    _globalDependency = context.read<GlobalDependency>();
    final preloadDepenpency = context.read<PreloadDependency>();
    final pushRds = RemotePushDataSource.create(preloadDepenpency.client);
    _pushNotificationsService = PushNotificationsService(
      FirebaseMessaging.instance,
      pushRds,
    );
    _pushNotificationsService.init();
  }

  @override
  void dispose() {}
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
