// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:http/http.dart' as http;

import '../model/time_off.dart';
import '../model/time_off_type.dart';

class TimeOffService {
  NetworkManager networkManager;
  TimeOffService({
    required this.networkManager,
  });

  Future<List<TimeOff>?> getTimeOffs() async {
    ResponseModel<List<TimeOff>> result = await networkManager
        .getData<List<TimeOff>, TimeOff>("127.0.0.1:8080", "/timeOff", TimeOff(), null);
    return result.data;
  }

  Future<TimeOff?> signTimeOff(int id) async {
    ResponseModel<TimeOff?> result = await networkManager
        .putData<TimeOff, TimeOff>("127.0.0.1:8080", "/timeOff/sign/$id", TimeOff(), null, null);
    return result.data;
  }
}
