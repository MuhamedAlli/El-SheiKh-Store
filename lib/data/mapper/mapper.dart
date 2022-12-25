import 'package:elsheikh_store/app/constants.dart';
import 'package:elsheikh_store/app/extensions.dart';
import 'package:elsheikh_store/domain/model/models.dart';

import '../response/responses.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(this?.token.orEmpty() ?? Constants.empty);
  }
}

extension ProductsResponseMapper on ProductsResponse? {
  Products toDomain() {
    Rating rating =
        this?.rating?.toDomain() ?? const Iterable.empty() as Rating;
    return Products(
        this?.id.orZero() ?? Constants.zero,
        this?.title.orEmpty() ?? Constants.empty,
        this?.price ?? Constants.doubleZero,
        this?.description.orEmpty() ?? Constants.empty,
        this?.category.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        rating);
  }
}

extension HomeProductsResponseMapper on HomeProductsResponse? {
  HomeProducts toDomain() {
    List<Products> homeProducts =
        (this?.products?.map((product) => product.toDomain()) ??
                const Iterable.empty())
            .cast<Products>()
            .toList();
    return HomeProducts(homeProducts);
  }
}

extension RaitingResponseMapper on RatingResponse? {
  Rating toDomain() {
    return Rating(this?.rate.orDoubleZero() ?? Constants.doubleZero,
        this?.count.orZero() ?? Constants.zero);
  }
}
