import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "token")
  String? token;
  LoginResponse(this.token);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "rating")
  RatingResponse? rating;

  ProductsResponse(this.id, this.title, this.price, this.description,
      this.category, this.image, this.rating);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@JsonSerializable()
class HomeProductsResponse {
  List<ProductsResponse>? products;
  HomeProductsResponse(this.products);
  Map<String, dynamic> toJson() => _$HomeProductsResponseToJson(this);
  factory HomeProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeProductsResponseFromJson(json);
}

@JsonSerializable()
class RatingResponse {
  @JsonKey(name: "rate")
  double? rate;
  @JsonKey(name: "count")
  int? count;

  RatingResponse(this.rate, this.count);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "rating")
  RatingResponse? rating;

  CategoryResponse(this.id, this.title, this.price, this.description,
      this.category, this.image, this.rating);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class HomeCategoryResponse {
  List<CategoryResponse>? category;
  HomeCategoryResponse(this.category);
  Map<String, dynamic> toJson() => _$HomeCategoryResponseToJson(this);
  factory HomeCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryResponseFromJson(json);
}
