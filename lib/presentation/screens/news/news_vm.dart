import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';
import 'package:template/domain/services/upload_service.dart';
import 'package:template/presentation/app/app.dart';

class NewsViewModel extends BaseViewModel {
  NewsViewModel(this.dashboardService, this.uploadService);

  final DashboardService dashboardService;
  final UploadService uploadService;

  List<DashContentResult> news = [];

  Future<void> onReady() async {
    await fetch();
  }

  Future<void> fetch() async {
    news = await dashboardService.fetchNews();
    notifyListeners();
  }

  Future<void> create({
    required String title,
    required String description,
    required String content,
    required XFile file,
  }) async {
    final url = await uploadService.uploadMedia(file);
    await dashboardService.addNews(
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
    await dashboardService.deleteNews(id);
    await fetch();
    // news.removeWhere((element) => element.id == id);
    // notifyListeners();
  }
}
