part of 'category_products_cubit.dart';

abstract class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

class CategoryProductsInitial extends CategoryProductsState {
  @override
  List<Object> get props => [];
}

class CategoryProductsLoadingState extends CategoryProductsState {
  @override
  List<Object> get props => [];
}

class CategoryProductsSuccessState extends CategoryProductsState {
  final List<Products> categoryProducts;
  const CategoryProductsSuccessState(this.categoryProducts);
  @override
  List<Object> get props => [categoryProducts];
}

class CategoryProductsFailureState extends CategoryProductsState {
  final Failure failure;
  const CategoryProductsFailureState(this.failure);
  @override
  List<Object> get props => [failure];
}
