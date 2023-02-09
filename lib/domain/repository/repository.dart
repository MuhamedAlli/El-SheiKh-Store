import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/data/network/requests.dart';
import '../../data/network/failure.dart';
import '../model/models.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, List<Products>>> getHomeProducts();
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Products>>> getHomeCategory(String catName);
  Future<Either<Failure, List<CartModel>>> getCart(int id);
  Future<Either<Failure, Products>> getProductById(int id);
}
