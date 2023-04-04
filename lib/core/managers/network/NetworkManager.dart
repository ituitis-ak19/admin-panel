import 'package:dio/dio.dart';

import 'IcoreDio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  String? token;

  String? username;

  NetworkManager._init() {
    token = "null";
  }
}
