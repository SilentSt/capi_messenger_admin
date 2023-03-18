import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';

class NewsViewModel extends BaseViewModel {
  NewsViewModel(this.dashboardService);

  final DashboardService dashboardService;

  List<DashContentResult> news = [];

  Future<void> onReady() async {}

  Future<void> fetch() async {
    news = await dashboardService.fetchNews();
    notifyListeners();
  }
  
}
