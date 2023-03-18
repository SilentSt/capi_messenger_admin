import 'package:template/data/data_sources/dashboard/remote_dashboard_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class DashboardService extends AppService {
  DashboardService(super.dialogService, this._rds);
  final RemoteDashboardDataSource _rds;

  Future<List<DashContentResult>> fetchNews() async {
    final res = await _rds.fetchNews();
    return res.body?.result ?? [];
  }

  Future<DashContentResult?> getNewsById(String id) async {
    final res = await _rds.getNewsById(id);
    return res.body?.result;
  }

  Future<dynamic> addNews(DashContentResult dto) async {
    final res = await _rds.addNews(dto);
  }

  Future<dynamic> updateNews(DashContentResult dto) async {
    final res = await _rds.updateNews(dto);
  }

  Future<dynamic> deleteNews(String id) async {
    final res = await _rds.deleteNews(id);
  }

  Future<List<DashContentResult>> fetchProducts() async {
    final res = await _rds.fetchProducts();
    return res.body?.result ?? [];
  }

  Future<DashContentResult?> getProductById(String id) async {
    final res = await _rds.getProductById(id);
    return res.body?.result;
  }

  Future<dynamic> addProduct(DashContentResult dto) async {
    final res = await _rds.addProduct(dto);
  }

  Future<dynamic> updateProduct(DashContentResult dto) async {
    final res = await _rds.updateProduct(dto);
  }

  Future<dynamic> deleteProduct(String id) async {
    final res = await _rds.deleteProduct(id);
  }
}
