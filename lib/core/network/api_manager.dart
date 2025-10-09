import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/dio_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';

final DioConsumer authApi = DioConsumer(
  dio: Dio(),
  baseUrl: EndPoint.uthBaseUrl,
);

// final DioConsumer carApi = DioConsumer(
//   dio: Dio(),
//   baseUrl: EndPoint.carBaseUrl,
// );

// final DioConsumer storeApi = DioConsumer(
//   dio: Dio(),
//   baseUrl: EndPoint.storeBaseUrl,
// );
