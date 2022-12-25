import 'package:dio/dio.dart';
import 'package:elsheikh_store/app/constants.dart';
import 'package:elsheikh_store/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/auth/login")
  Future<LoginResponse> login(
      @Field("username") String username, @Field("password") String password);
  @GET("/products/")
  Future<HomeProductsResponse?> getHomeProducts();
  @GET("/products/category/")
  Future<HomeProductsResponse?> getHomeCategory(@Path() String categoryName);
}
