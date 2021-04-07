import 'dart:html';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:imola_demo/api/error_interceptor.dart';
import 'package:imola_demo/api/global.dart';
import 'package:imola_demo/api/proxy.dart';

class Http {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static Http _instance = Http._internal();
  factory Http() => _instance;

  Dio dio;
  CancelToken _cancelToken = new CancelToken();

  Http._internal() {
    if (dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions options = new BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        //响应流上前后两次接受到数据的间隔，单位为毫秒
        receiveTimeout: RECEIVE_TIMEOUT,
        //Http 请求头
        headers: {},
      );

      dio = new Dio(options);

      //添加error拦截器
      dio.interceptors.add(ErrorInterceptor());

      //调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
      if (PROXY_ENABLE) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.findProxy = (uri) {
            return "PROXY $PROXY_IP:$PROXY_PORT";
          };
          //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
          client.badCertificateCallback =
              (X509Certificate cate, String host, int port) => true;
        };
      }
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时时间
  /// [receiveTimeout] 接收超时时间
  /// [interceptors] 基础拦截器
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors..addAll(interceptors);
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求， 当一个cancel token取消时，所有使用该cancel token
   * 所以参数可选
  */
  void cancelRequests({CancelToken token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  ///读取本地配置
  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String accessToken = Global.accessToken;
    if (accessToken != null) {
      headers = {
        'Authorization': 'Bearer $accessToken',
      };
    }
    return headers;
  }
}
