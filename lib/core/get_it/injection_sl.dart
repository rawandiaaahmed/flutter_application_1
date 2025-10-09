// import 'package:dio/dio.dart' show Dio;
// import 'package:flutter_application_1/core/network/api_consumer.dart';
// import 'package:flutter_application_1/core/network/dio_consumer.dart';

// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Core
//   sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio(), baseUrl: ''));

//   // repositories
//  // sl.registerLazySingleton(() => AuthRepository(api: sl<ApiConsumer>()));


//   // cubits
//  // sl.registerFactory(() => UserCubit(sl()));
 

// }