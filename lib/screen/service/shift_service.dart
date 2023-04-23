// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/shift.dart';

class ShiftService {
  NetworkManager networkManager;
  ShiftService({
    required this.networkManager,
  });

  Future<List<Shift>?> getShifts() async {
    ResponseModel<List<Shift>> result = await networkManager
        .getData<List<Shift>, Shift>("127.0.0.1:8080", "/shift", Shift(), null);
    return result.data;
  }

  Future<Shift?> getShiftById(int id) async {
    ResponseModel<Shift> result = await networkManager
        .getData<Shift, Shift>("127.0.0.1:8080", "/shift/$id", Shift(), null);
    return result.data;
  }

  Future<Shift?> updateShift(Shift shift) async {
    ResponseModel<Shift?> result = await networkManager
        .putData<Shift, Shift>("127.0.0.1:8080", "/shift", Shift(), json.encode(shift.toJson()) , null);
    return result.data;
  }

  Future<Shift?> create(Shift shift) async {
    ResponseModel<Shift?> result = await networkManager
        .postData<Shift, Shift>("127.0.0.1:8080", "/shift", Shift(), json.encode(shift.toJson()) , null);
    return result.data;
  }
}
