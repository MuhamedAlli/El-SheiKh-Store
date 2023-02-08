import 'package:elsheikh_store/data/data_source/remote_data_source.dart';
import 'package:elsheikh_store/data/mapper/mapper.dart';
import 'package:elsheikh_store/data/network/error_handler.dart';
import 'package:elsheikh_store/data/network/network_info.dart';
import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/data/network/requests.dart';
import 'package:elsheikh_store/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        //internet is connected , its safe to call API
        final response = await _remoteDataSource.login(loginRequest);
        if (response.token!.isNotEmpty) {
          //return the data
          //print(response.token);
          return Right(response.toDomain());
        } else {
          return Left(Failure(409, "business error"));
        }
      } catch (error) {
        // print(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //no Internet Connection!
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getHomeProducts() async {
    if (await _networkInfo.isConnected) {
      try {
        //internet is connected , its safe to call API
        final response = await _remoteDataSource.getHomeProducts();

        if (response != null) {
          //return the data
          return Right(response.toDomain());
        } else {
          return Left(Failure(409, "business error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //no Internet Connection!
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        //internet is connected , its safe to call API
        final response = await _remoteDataSource.getCategories();

        if (response != null) {
          //return the data
          return Right(response);
        } else {
          return Left(Failure(409, "business error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //no Internet Connection!
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getHomeCategory(
      String catName) async {
    if (await _networkInfo.isConnected) {
      try {
        //internet is connected , its safe to call API
        final response = await _remoteDataSource.getHomeCategory(catName);
        //print(response.toString());
        if (response != null) {
          //return the data
          return Right(response.toDomain());
        } else {
          return Left(Failure(409, "business error"));
        }
      } catch (error) {
        //print(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //no Internet Connection!
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        //internet is connected , its safe to call API
        final response = await _remoteDataSource.getCart(id);
        print(response.toString());
        if (response != null) {
          //return the data
          return Right(response.toDomain());
        } else {
          return Left(Failure(409, "business error"));
        }
      } catch (error) {
        print(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //no Internet Connection!
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
