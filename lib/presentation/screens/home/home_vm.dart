import 'dart:typed_data';

import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.dashboardService);
  final DashboardService dashboardService;

  Future<void> onReady() async {}
  Future<void> create({
    required String title,
    required String description,
    required String content,
    required Uint8List bytes,
  }) async {
    dashboardService.addProduct(
      DashContentResult(
        title: title,
        description: description,
        content: content,
      ),
    );
  }

  Future<void> uploadImage() async {}
}
