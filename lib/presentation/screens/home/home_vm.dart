import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';
import 'package:template/domain/services/upload_service.dart';
import 'package:template/presentation/app/app.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(
    this.dashboardService,
    this.uploadService,
  );
  final DashboardService dashboardService;
  final UploadService uploadService;

  Future<void> onReady() async {}
  

  Future<void> uploadImage() async {}
}
