// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/screen/model/department_detail.dart';

import '../model/department.dart';

class DepartmentService {
  NetworkManager networkManager;
  DepartmentService({
    required this.networkManager,
  });

  Future<List<Department>?> getDepartments() async {
    ResponseModel<List<Department>> result = await networkManager
        .getData<List<Department>, Department>("127.0.0.1:8080", "/department", Department(), null);
    return result.data;
  }

  Future<DepartmentDetail?> getDepartmentDetail(int id) async {
    ResponseModel<DepartmentDetail?> result = await networkManager
        .getData<DepartmentDetail, DepartmentDetail>("127.0.0.1:8080", "/department/$id", DepartmentDetail(), null);
    return result.data;
  }

  Future<DepartmentDetail?> updateDepartment(DepartmentDetail departmentDetail) async {
    ResponseModel<DepartmentDetail?> result = await networkManager
        .putData<DepartmentDetail, DepartmentDetail>("127.0.0.1:8080", "/department", DepartmentDetail(), json.encode(departmentDetail.toJson()) , null);
    return result.data;
  }

  Future<DepartmentDetail?> create(DepartmentDetail departmentDetail) async {
    ResponseModel<DepartmentDetail?> result = await networkManager
        .postData<DepartmentDetail, DepartmentDetail>("127.0.0.1:8080", "/department", DepartmentDetail(), json.encode(departmentDetail.toJson()) , null);
    return result.data;
  }
}
