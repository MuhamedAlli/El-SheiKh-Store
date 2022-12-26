part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class FailureHomePage extends HomePageState {
  final Failure failure;
  const FailureHomePage(this.failure);
}

class LoadedHomePage extends HomePageState {
  final List<Products> products;
  const LoadedHomePage(this.products);
}
