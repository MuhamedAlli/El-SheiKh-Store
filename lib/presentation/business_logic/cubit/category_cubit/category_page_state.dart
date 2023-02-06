part of 'category_page_cubit.dart';

abstract class CategoryPageState extends Equatable {
  const CategoryPageState();

  @override
  List<Object> get props => [];
}

class CategoryPageInitial extends CategoryPageState {}

class FailureCategoryPage extends CategoryPageState {
  final Failure failure;
  const FailureCategoryPage(this.failure);
}

class LoadedCategoryPage extends CategoryPageState {
  final List<String> categories;
  const LoadedCategoryPage(this.categories);
}
