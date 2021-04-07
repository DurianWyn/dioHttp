import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imola_demo/api/app_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //error 统一处理
    AppException appException = AppException.create(err);
    //错误提示
    debugPrint('DioError====: ${appException.toString()}');
    //错误弹窗

    err.error = appException;
    return super.onError(err, handler);
  }
}
