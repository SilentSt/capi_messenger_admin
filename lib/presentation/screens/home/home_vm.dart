import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.dashboardService);
  final DashboardService dashboardService;

  Future<void> onReady() async {}
  Future<void> create() async {
    dashboardService.addProduct(
      DashContentResult(),
    );
  }

  Future<void> uploadImage() async {}
}
