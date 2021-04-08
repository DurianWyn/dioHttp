/// 全局配置
class Global {
  /// token
  static String accessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIyNiwidXNlcktpbmQiOjQsInVzZXJJZCI6MjI2LCJleHAiOjE2MjQyNjQ5NTV9.NDgpjHB7WPOsUdZpXkQSMNXHoWnwfPer6kcg6Iz4e2k";
  static bool retryEnable = true;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
}
