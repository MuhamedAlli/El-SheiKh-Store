import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/base_usecase.dart';

class HomeProductUseCase implements BaseUseCase<void, HomeProducts> {
  final Repository _repository;
  HomeProductUseCase(this._repository);
  @override
  Future<Either<Failure, HomeProducts>> excute(void input) async {
    return await _repository.getHomeProducts();
  }
}
