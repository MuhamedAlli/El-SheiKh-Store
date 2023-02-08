import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/network/failure.dart';
import '../../../../domain/model/models.dart';
import '../../../../domain/usecase/category_product_usecase.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(
      {required CategoryProductUseCase categoryProductsUseCase})
      : _categoryPructsUseCase = categoryProductsUseCase,
        super(CategoryProductsInitial());
  final CategoryProductUseCase _categoryPructsUseCase;

  Future<void> getAllProductsOfCategory(String catName) async {
    emit(CategoryProductsLoadingState());
    final result = await _categoryPructsUseCase.excute(catName);
    result.fold(
        (failure) => emit(
              CategoryProductsFailureState(failure),
            ), (categories) {
      //print(categories);
      return emit(
        CategoryProductsSuccessState(categories),
      );
    });
  }
}
