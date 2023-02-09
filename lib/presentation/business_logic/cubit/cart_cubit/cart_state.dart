part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessState extends CartState {
  final List<CartModel> cart;
  const CartSuccessState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartFailureSate extends CartState {
  final Failure failure;
  const CartFailureSate(this.failure);
  @override
  List<Object> get props => [failure];
}

class GetProductByIdSuccessState extends CartState {
  final Products products;
  const GetProductByIdSuccessState(this.products);
  @override
  List<Object> get props => [products];
}

class GetProductByIdFailureState extends CartState {
  final Failure failure;
  const GetProductByIdFailureState(this.failure);
  @override
  List<Object> get props => [failure];
}
