import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/base_usecase.dart';

class CategoriesUseCase implements BaseUseCase<void, List<String>> {
  final Repository _repository;
  CategoriesUseCase(this._repository);
  @override
  Future<Either<Failure, List<String>>> excute(void input) async {
    return await _repository.getCategories();
  }
}
