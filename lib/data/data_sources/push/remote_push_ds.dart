import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_push_ds.chopper.dart';

@ChopperApi(baseUrl: 'push/') //TODO: change url
abstract class RemotePushDataSource extends ChopperService{
  static RemotePushDataSource create([ChopperClient? client]) =>
      _$RemotePushDataSource(client);

  @Post(path: 'setToken')
  Future<Response<AuthResultModel>> setToken(@Body() final String token);
}
