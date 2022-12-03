import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/data/network/requests.dart';
import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, LoginModel> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, LoginModel>> excute(LoginUseCaseInput input) async {
    return await _repository
        .login(LoginRequest(input.username, input.password));
  }
}

class LoginUseCaseInput {
  String username;
  String password;
  LoginUseCaseInput(this.username, this.password);
}
