import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:logger/logger.dart';
import 'model.dart';

part 'api_read.g.dart';

@RestApi(baseUrl: 'http://localhost:8000/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @GET('/getTimestampsWithFrames')
  Future<Model> getTimestamps();

}

final logger = Logger();
void main(){

  final dio = Dio();
  final client = RestClient(dio);

  client.getTimestamps().then((it) => logger.i(it));
}

