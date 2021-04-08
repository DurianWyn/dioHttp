import 'dart:async';
import 'package:imola_demo/api/api_response.dart';
import 'package:imola_demo/api/http_utils.dart';
import 'package:imola_demo/models/user.dart';

class MineModel {
  MineModel();

  static Future<ApiResponse<User>> getUser() async {
    try {
      var response = await HttpUtils.get('py.mine.home/1.2.0/info');
      return ApiResponse.completed(response.data);
    } catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
