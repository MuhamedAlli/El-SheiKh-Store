import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/base_usecase.dart';

class CategoryProductUseCase implements BaseUseCase<String, List<Products>> {
  final Repository _repository;
  CategoryProductUseCase(this._repository);

  @override
  Future<Either<Failure, List<Products>>> excute(String input) async {
    return await _repository.getHomeCategory(input);
  }
}
