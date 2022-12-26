import 'package:elsheikh_store/app/constants.dart';
import 'package:elsheikh_store/app/extensions.dart';
import 'package:elsheikh_store/domain/model/models.dart';

import '../response/responses.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(this?.token.orEmpty() ?? Constants.empty);
  }
}

extension ProductsResponseMapper on List<ProductsResponse>? {
  List<Products> toDomain() {
    if (this != null) {
      return this!
          .map((productsResponse) => Products(
              productsResponse.id.orZero(),
              productsResponse.title.orEmpty(),
              productsResponse.price.orDoubleZero(),
              productsResponse.description.orEmpty(),
              productsResponse.category.orEmpty(),
              productsResponse.image.orEmpty(),
              productsResponse.rating.toDomain()))
          .toList();
    } else {
      return const Iterable.empty().cast<Products>().toList();
    }
  }
}
/*
extension HomeProductsResponseMapper on HomeProductsResponse? {
  HomeProducts toDomain() {
    List<Products> homeProducts =
        (this?.products?.map((product) => product.toDomain()) ??
                const Iterable.empty())
            .cast<Products>()
            .toList();
    return HomeProducts(homeProducts);
  }
}*/

extension RaitingResponseMapper on RatingResponse? {
  Rating toDomain() {
    return Rating(this?.rate.orDoubleZero() ?? Constants.doubleZero,
        this?.count.orZero() ?? Constants.zero);
  }
}
