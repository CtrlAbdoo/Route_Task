import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_task/feature/home/presentation/cubits/product_cubit.dart';

import '../../feature/home/data/repository/product_repository.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;


void initServiceLocator(){
  //cubits

   sl.registerLazySingleton(()=>ProductCubit(sl()));

  //product feature
   sl.registerLazySingleton(() => ProductRepository());
  //external
  sl.registerLazySingleton(()=>CacheHelper());

  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(sl()));
  sl.registerLazySingleton(()=>Dio());


}