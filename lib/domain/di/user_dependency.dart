import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/data_sources/dashboard/remote_dashboard_ds.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/preload.dart';
import 'package:template/domain/services/dashboard_service.dart';

class UserDependency extends AppDependency {
  UserDependency(super.context);

  late final GlobalDependency _globalDependency;
  late final DashboardService _dashboardService;

  DashboardService get dashboardService => _dashboardService;

  @override
  Future<void> init(BuildContext context) async {
    _globalDependency = context.read<GlobalDependency>();
    final preloadDepenpency = context.read<PreloadDependency>();
    final dashRds = RemoteDashboardDataSource.create(preloadDepenpency.client);

    _dashboardService = DashboardService(_globalDependency.errorService, dashRds);    
  }

  @override
  void dispose() {}
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
