import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';
import 'package:template/domain/services/upload_service.dart';

class ProductsViewModel extends BaseViewModel {
  ProductsViewModel(
    this.dashboardService,
    this.uploadService,
  );

  final DashboardService dashboardService;
  final UploadService uploadService;

  List<DashContentResult> products = [];

  Future<void> onReady() async {
    await fetch();
  }

  Future<void> fetch() async {
    products = await dashboardService.fetchProducts();
    notifyListeners();
  }

  Future<void> create({
    required String title,
    required String description,
    required String content,
    required XFile file,
  }) async {
    final url = await uploadService.uploadMedia(file);

    await dashboardService.addProduct(
      DashContentResult(
        title: title,
        description: description,
        content: content,
        previewId: url,
      ),
    );
    await fetch();
  }

  Future<void> delete(String? id) async {
    if (id == null) return;
    await dashboardService.deleteProduct(id);
    await fetch();
  }
}
