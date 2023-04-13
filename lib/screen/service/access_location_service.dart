// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/screen/model/access_location.dart';

import '../model/access_location_detail.dart';


class AccessLocationService {
  NetworkManager networkManager;
  AccessLocationService({
    required this.networkManager,
  });

  Future<List<AccessLocation>?> getAccessLocations() async {
    ResponseModel<List<AccessLocation>> result = await networkManager
        .getData<List<AccessLocation>, AccessLocation>("127.0.0.1:8080", "/accesslocation", AccessLocation(), null);
    return result.data;
  }

  Future<AccessLocationDetail?> getAccessLocationDetail(int id) async {
    ResponseModel<AccessLocationDetail?> result = await networkManager
        .getData<AccessLocationDetail, AccessLocationDetail>("127.0.0.1:8080", "/accesslocation/$id", AccessLocationDetail(), null);
    return result.data;
  }

  Future<AccessLocationDetail?> updateAccessLocation(AccessLocationDetail accessLocationDetail) async {
    ResponseModel<AccessLocationDetail?> result = await networkManager
        .putData<AccessLocationDetail, AccessLocationDetail>("127.0.0.1:8080", "/accesslocation", AccessLocationDetail(), json.encode(accessLocationDetail.toJson()) , null);
    return result.data;
  }
}
