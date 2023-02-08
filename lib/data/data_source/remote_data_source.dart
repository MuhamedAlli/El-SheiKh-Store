import 'package:elsheikh_store/data/network/app_api.dart';
import 'package:elsheikh_store/data/network/requests.dart';
import 'package:elsheikh_store/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<List<ProductsResponse>?> getHomeProducts();
  Future<List<String>?> getCategories();
  Future<List<ProductsResponse>?> getHomeCategory(String catName);
  Future<List<CartResponse>?> getCart(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.username, loginRequest.password);
  }

  @override
  Future<List<ProductsResponse>?> getHomeProducts() async {
    return await _appServiceClient.getHomeProducts();
  }

  @override
  Future<List<String>?> getCategories() async {
    return await _appServiceClient.getCategories();
  }

  @override
  Future<List<ProductsResponse>?> getHomeCategory(String catName) async {
    return await _appServiceClient.getHomeCategory(catName);
  }

  @override
  Future<List<CartResponse>?> getCart(int id) async {
    return await _appServiceClient.getCart(id);
  }
}
