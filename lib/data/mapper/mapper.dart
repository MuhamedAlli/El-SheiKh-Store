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
//

extension ProductsResponse2Mapper on ProductsResponse? {
  Products toDomain() {
    return Products(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.price.orDoubleZero() ?? Constants.doubleZero,
      this?.description.orEmpty() ?? Constants.empty,
      this?.category.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this!.rating.toDomain(),
    );
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

extension CartResponseMapper on List<CartResponse>? {
  List<CartModel> toDomain() {
    if (this != null) {
      return this!
          .map(
            (cartResponse) => CartModel(
                cartResponse.id.orZero(),
                cartResponse.userId.orZero(),
                cartResponse.date.orEmpty(),
                cartResponse.products.toDomain(),
                cartResponse.iV.orZero()),
          )
          .toList();
    } else {
      return const Iterable.empty().cast<CartModel>().toList();
    }
  }
}

extension ProductOfCatResponseMapper on List<ProductOfCatResponse>? {
  List<ProductOfCatModel> toDomain() {
    if (this != null) {
      return this!
          .map(
            (productOfCatResponse) => ProductOfCatModel(
              productOfCatResponse.productId.orZero(),
              productOfCatResponse.quantity.orZero(),
            ),
          )
          .toList();
    } else {
      return const Iterable.empty().cast<ProductOfCatModel>().toList();
    }
  }
}
