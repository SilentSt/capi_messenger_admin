import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';

class ProductsViewModel extends BaseViewModel {
  ProductsViewModel(this.dashboardService);

  final DashboardService dashboardService;

  List<DashContentResult> products = [];

  Future<void> onReady() async {}

  Future<void> fetch() async {
    products = await dashboardService.fetchProducts();
    notifyListeners();
  }
}
