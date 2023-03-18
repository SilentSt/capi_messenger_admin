import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_dashboard_ds.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class RemoteDashboardDataSource extends ChopperService {
  static RemoteDashboardDataSource create([ChopperClient? client]) => _$RemoteDashboardDataSource(client);

  @Get(path: 'News/all')
  Future<Response<DashsContentModel>> fetchNews();

  @Get(path: 'News/{id}')
  Future<Response<DashContentModel>> getNewsById(@Path('id') String id);

  @Post(path: 'News')
  Future<Response<dynamic>> addNews(@Body() DashContentResult dto);

  @Patch(path: 'News')
  Future<Response<dynamic>> updateNews(@Body() DashContentResult dto);

  @Delete(path: 'News/{id}')
  Future<Response<dynamic>> deleteNews(@Path('id') String id);


  @Get(path: 'Products/all')
  Future<Response<DashsContentModel>> fetchProducts();

  @Get(path: 'Products/{id}')
  Future<Response<DashContentModel>> getProductById(@Path('id') String id);

  @Post(path: 'Products')
  Future<Response<dynamic>> addProduct(@Body() DashContentResult dto);

  @Patch(path: 'Products')
  Future<Response<dynamic>> updateProduct(@Body() DashContentResult dto);

  @Delete(path: 'Products/{id}')
  Future<Response<dynamic>> deleteProduct(@Path('id') String id);
}
