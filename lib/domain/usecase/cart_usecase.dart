import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/model/models.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class CartUseCase implements BaseUseCase<int, List<CartModel>> {
  final Repository _repository;
  CartUseCase(this._repository);

  @override
  Future<Either<Failure, List<CartModel>>> excute(int input) async {
    return await _repository.getCart(input);
  }
}
