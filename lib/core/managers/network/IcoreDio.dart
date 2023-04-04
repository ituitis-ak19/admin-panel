import 'dart:io';

import '../../base/model/BaseError.dart';
import '../../base/model/BaseModel.dart';
import '../../constants/app/Enums/HTTPRequestEnum.dart';
import 'IResponseModel.dart';
//import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    //httpClientAdapter = DefaultHttpClientAdapter();
  }
  R? _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data
          .map((e) => model.fromJson(new Map<String, Object>.from(e)))
          .toList()
          .cast<T>() as R;
    } else if (data is Map) {
      data.forEach((key, value) {
        if (value == null) data.update(key, (value) => "veri yuklenemedi");
      });
      return model.fromJson(new Map<String, Object>.from(data)) as R;
    }
    return data as R?;
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response =
        await request(path, data: data, options: Options(method: type.name));
    switch (response.statusCode) {
      case HttpStatus.ok:
        //case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError(response.statusMessage));
    }
  }
}
