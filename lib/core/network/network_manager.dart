import 'dart:convert';

import 'package:http/http.dart';
import 'package:admin_ui/core/base/base_model.dart';
import 'package:http/http.dart' as http;
import 'package:admin_ui/core/network/model/response_model.dart';

class NetworkManager {
  Future<ResponseModel<R>> postData<R, T>(
      String url, String path, BaseModel<T> baseModel, String? data, String? token) async {
    Response res;

    try {
      res =
          await http.post(Uri.http(url, path), body: data, headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token ?? "",
      });
      return handleResponse(res, baseModel);
    } catch (e) {
      print(e);
    }
    return ResponseModel<R>();
  }

  Future<ResponseModel<R>> getData<R, T>(
      String url, String path, BaseModel<T> baseModel, String? token) async {
    ResponseModel<R> responseModel = ResponseModel();

    try {
      var res =
          await http.get(Uri.http(url, path), headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token ?? "",
      });
      return handleResponse(res, baseModel);
    } catch (e) {
      responseModel.error = true;
      print(e);
    }

    return responseModel;
  }

  Future<ResponseModel<R>> putData<R, T>(
      String url, String path, BaseModel<T> baseModel, String? data, String? token) async {
    Response res;

    try {
      res =
          await http.put(Uri.http(url, path), body: data, headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token ?? "",
      });
      return handleResponse(res, baseModel);
    } catch (e) {
      print(e);
    }
    return ResponseModel<R>();
  }

  ResponseModel<R> handleResponse<R, T>(Response res, BaseModel<T> baseModel) {
    ResponseModel<R> result = ResponseModel();
    switch (res.statusCode) {
      case 200:
        if (jsonDecode(res.body) != null) {
          var jsonBody = jsonDecode(res.body);

          if (jsonBody is List) {
            result.data = jsonBody
                .map((json) => baseModel.fromJson(json))
                .toList()
                .cast<T>() as R;
          } else {
            result.data = baseModel.fromJson(jsonBody) as R;
          }
          //result.data =
          //  resultList.map((json) => baseModel.fromJson(json)).toList() as R;
        } else {
          result.error = true;
        }
        break;
      default:
    }
    return result;
  }
}
