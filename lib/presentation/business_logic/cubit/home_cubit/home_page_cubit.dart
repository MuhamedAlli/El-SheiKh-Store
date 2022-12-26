import 'dart:ffi';

import 'package:elsheikh_store/data/network/failure.dart';
import 'package:elsheikh_store/domain/usecase/home_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/models.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required HomeProductUseCase homeProductUseCase})
      : _homeProductUseCase = homeProductUseCase,
        super(HomePageInitial());
  final HomeProductUseCase _homeProductUseCase;

  Future<void> getAllProducts() async {
    emit(HomePageInitial());
    // ignore: void_checks
    final result = await _homeProductUseCase.excute(Void);
    result.fold(
      (failure) => emit(
        FailureHomePage(failure),
      ),
      (homeProducts) => emit(
        LoadedHomePage(homeProducts),
      ),
    );
  }
}
