import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:imola_demo/api/cache.dart';
import 'package:sp_util/sp_util.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCacheInterceptor extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!CACHE_ENABLE) return;

    // refresh标记是否是刷新缓存
    bool refresh = options.extra["refresh"] == true;

    // 是否磁盘缓存
    bool cacheDisk = options.extra["cacheDisk"] = true;

    //如果刷新，先删除相关缓存
    if (refresh) {
      // 删除uri相同的内存缓存
      delete(options.uri.toString());

      // 删除磁盘缓存
      if (cacheDisk) {
        await SpUtil.remove(options.uri.toString());
      }
      return;
    }

    // get 请求，开始缓存
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();

      // 策略 1 内存缓存优先， 2 然后才是磁盘缓存

      // 1 内存缓存
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          return;
        }
      }
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
