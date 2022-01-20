import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_app/src/data/weather_api.dart';
import 'package:weather_app/src/locator.dart';

import 'src/app.dart';

void main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  print('message');

  final dio = Dio();
  dio.interceptors.add(LoggyDioInterceptor(responseBody: false));

  locator.registerLazySingleton(() => WeatherApi(dio));

  runApp(const WeatherApp());
}
