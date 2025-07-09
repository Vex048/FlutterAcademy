import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:logger/logger.dart';
import 'model.dart';

part 'api_read.g.dart';


// Klasa klienta restowego
@RestApi(baseUrl: 'http://localhost:8000/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  // Metoda GET, która służy do fetchowania modelu
  @GET('/getTimestampsWithFrames')
  Future<Model> getTimestamps();

}
// Metoda, która jest przypisana do przycisku w celu pobrania danych oraz wyświelenia w aplikacji
Future<Model> callAPI() async {
  final dio = Dio();
  final client = RestClient(dio);
  return await client.getTimestamps();
}

