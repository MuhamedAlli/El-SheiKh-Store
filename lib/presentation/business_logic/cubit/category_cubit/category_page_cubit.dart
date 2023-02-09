import 'dart:ffi';
import 'package:elsheikh_store/domain/usecase/categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/network/failure.dart';

part 'category_page_state.dart';

class CategoryPageCubit extends Cubit<CategoryPageState> {
  CategoryPageCubit({required CategoriesUseCase categoriesUseCase})
      : _categoriesUseCase = categoriesUseCase,
        super(CategoryPageInitial());

  final CategoriesUseCase _categoriesUseCase;

  Future<void> getAllCategories() async {
    emit(CategoryPageInitial());
    // ignore: void_checks
    final result = await _categoriesUseCase.excute(Void);
    result.fold(
      (failure) => emit(
        FailureCategoryPage(failure),
      ),
      (categories) => emit(
        LoadedCategoryPage(categories),
      ),
    );
  }
}
