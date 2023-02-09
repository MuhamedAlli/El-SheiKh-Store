import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class ProductByIdUseCase extends BaseUseCase<int, Products> {
  final Repository _repository;
  ProductByIdUseCase(this._repository);
  @override
  Future<Either<Failure, Products>> excute(int input) async {
    return await _repository.getProductById(input);
  }
}
