export 'password.dart';
export 'username.dart';

//onBoarding Model
class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

//Login models
class LoginModel {
  String token;
  LoginModel(this.token);
}

class Rating {
  double rate;
  int count;

  Rating(this.rate, this.count);
}

class Products {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Products(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);
}

class HomeProducts {
  List<Products> products;
  HomeProducts(this.products);
}

class Category {
  int id;
  String title;
  int price;
  String description;
  String category;
  String image;
  Rating rating;

  Category(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);
}

class CartModel {
  int id;
  int userId;
  String date;
  List<ProductOfCatModel> products;
  int iV;
  CartModel(this.id, this.userId, this.date, this.products, this.iV);
}

class ProductOfCatModel {
  int productId;
  int quantity;
  ProductOfCatModel(this.productId, this.quantity);
}

class UserCartModel {
  List<CartModel> carts;
  UserCartModel(this.carts);
}
