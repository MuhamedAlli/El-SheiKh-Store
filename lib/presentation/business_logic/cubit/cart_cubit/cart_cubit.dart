import 'package:elsheikh_store/domain/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/network/failure.dart';
import '../../../../domain/usecase/cart_usecase.dart';
import '../../../../domain/usecase/product_by_id_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      {required CartUseCase cartUseCase,
      required ProductByIdUseCase productByIdUseCase})
      : _cartUseCase = cartUseCase,
        _productByIdUseCase = productByIdUseCase,
        super(CartInitial());
  final CartUseCase _cartUseCase;
  final ProductByIdUseCase _productByIdUseCase;

  List<CartModel> cartList = [];
  Future<List<CartModel>> getUserCart(int id) async {
    emit(CartLoadingState());
    // ignore: void_checks
    final result = await _cartUseCase.excute(id);
    result.fold(
        (failure) => emit(
              CartFailureSate(failure),
            ), (cart) {
      cartList = cart;
      return emit(
        CartSuccessState(cart),
      );
    });
    return cartList;
  }

  List<Products> productsOfUserCart = [];
  List<ProductOfCatModel> productOfCartModel = [];
  double totalPrice = 0;
  void getproductsOfUserCart() async {
    await getUserCart(2);
    if (cartList.isNotEmpty) {
      for (int i = 0; i < cartList.length; i++) {
        productsOfUserCart = [];
        productOfCartModel = [];
        totalPrice = 0;
        for (int j = 0; j < cartList[i].products.length; j++) {
          productOfCartModel.add(cartList[i].products[j]);
          final result = await _productByIdUseCase
              .excute(cartList[i].products[j].productId);
          result.fold(
            (failure) => emit(
              CartFailureSate(failure),
            ),
            (product) {
              productsOfUserCart.add(product);
              totalPrice += cartList[i].products[j].quantity *
                  productsOfUserCart[j].price;
              return emit(
                GetProductByIdSuccessState(product),
              );
            },
          );
        }
      }
    }
    //print(productsOfUserCart[1].price);
  }
}
