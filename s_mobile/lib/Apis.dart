import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s_mobile/Member.dart';

part 'Apis.g.dart';

@RestApi(baseUrl: "https://mobile.apsbarakasacco.co.ke:2100/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/member")
  Future<Member> getmember();
}
