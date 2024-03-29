import 'package:dio/dio.dart';
import 'package:elsheikh_store/app/app_prefs.dart';
import 'package:elsheikh_store/data/data_source/remote_data_source.dart';
import 'package:elsheikh_store/data/network/app_api.dart';
import 'package:elsheikh_store/data/network/dio_factory.dart';
import 'package:elsheikh_store/data/network/network_info.dart';
import 'package:elsheikh_store/data/repository_impl/repository_impl.dart';
import 'package:elsheikh_store/domain/repository/repository.dart';
import 'package:elsheikh_store/domain/usecase/cart_usecase.dart';
import 'package:elsheikh_store/domain/usecase/categories_usecase.dart';
import 'package:elsheikh_store/domain/usecase/home_product_usecase.dart';
import 'package:elsheikh_store/domain/usecase/login_usecase.dart';
import 'package:elsheikh_store/presentation/business_logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:elsheikh_store/presentation/business_logic/cubit/category_cubit/category_page_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/category_product_usecase.dart';
import '../domain/usecase/product_by_id_usecase.dart';
import '../presentation/business_logic/bloc/login_bloc/login_bloc.dart';
import '../presentation/business_logic/cubit/cubit_products/category_products_cubit.dart';
import '../presentation/business_logic/cubit/home_cubit/home_page_cubit.dart';

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

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeProductUseCase>()) {
    instance.registerFactory<HomeProductUseCase>(
        () => HomeProductUseCase(instance<Repository>()));
    instance.registerFactory<HomePageCubit>(() =>
        HomePageCubit(homeProductUseCase: instance<HomeProductUseCase>()));
  }
}

initCatModule() {
  if (!GetIt.I.isRegistered<CategoriesUseCase>()) {
    instance.registerFactory<CategoriesUseCase>(
        () => CategoriesUseCase(instance<Repository>()));
    instance.registerFactory<CategoryPageCubit>(() =>
        CategoryPageCubit(categoriesUseCase: instance<CategoriesUseCase>()));
  }
}

//init module to get Products of particular Category
initCatProductsModule() {
  if (!GetIt.I.isRegistered<CategoryProductUseCase>()) {
    instance.registerFactory<CategoryProductUseCase>(
        () => CategoryProductUseCase(instance<Repository>()));
    instance.registerFactory<CategoryProductsCubit>(() => CategoryProductsCubit(
        categoryProductsUseCase: instance<CategoryProductUseCase>()));
  }
}

//init car module

initCartModule() {
  if (!GetIt.I.isRegistered<CartUseCase>()) {
    instance.registerFactory<CartUseCase>(
        () => CartUseCase(instance<Repository>()));
    instance.registerFactory<ProductByIdUseCase>(
        () => ProductByIdUseCase(instance<Repository>()));
    instance.registerFactory<CartCubit>(() => CartCubit(
          cartUseCase: instance<CartUseCase>(),
          productByIdUseCase: instance<ProductByIdUseCase>(),
        ));
  }
}
//init getProductById For UserCart

initGetProductByIdModule() {
  if (!GetIt.I.isRegistered<ProductByIdUseCase>()) {
    instance.registerFactory<ProductByIdUseCase>(
        () => ProductByIdUseCase(instance<Repository>()));
    instance.registerFactory<CartCubit>(() => CartCubit(
          cartUseCase: instance<CartUseCase>(),
          productByIdUseCase: instance<ProductByIdUseCase>(),
        ));
  }
}
