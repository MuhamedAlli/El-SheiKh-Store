import 'package:dio/dio.dart';
import 'package:elsheikh_store/app/app_prefs.dart';
import 'package:elsheikh_store/data/data_source/remote_data_source.dart';
import 'package:elsheikh_store/data/network/app_api.dart';
import 'package:elsheikh_store/data/network/dio_factory.dart';
import 'package:elsheikh_store/data/network/network_info.dart';
import 'package:elsheikh_store/data/repository_impl/repository_impl.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/business_logic/bloc/login_bloc/login_bloc.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  //shared prefrence instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app Preference instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  //Network Info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  //DioFactory instance
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreferences>()));

  //get Dio instance using di
  Dio dio = await instance<DioFactory>().getDio();
  //AppServiceClient instance
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //remoteDataSource instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));
  //Repository instance

  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
    instance.registerFactory<LoginBloc>(
        () => LoginBloc(loginUseCase: instance<LoginUseCase>()));
  }
}
