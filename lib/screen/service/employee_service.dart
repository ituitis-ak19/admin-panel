// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/screen/model/employee_detail.dart';

import '../model/employee.dart';

class EmployeeService {
  NetworkManager networkManager;
  EmployeeService({
    required this.networkManager,
  });

  Future<List<Employee>?> getEmployees() async {
    ResponseModel<List<Employee>> result = await networkManager
        .getData<List<Employee>, Employee>("127.0.0.1:8080", "/employee", Employee(), null);
    return result.data;
  }

  Future<List<Employee>?> getManagers() async {
    ResponseModel<List<Employee>> result = await networkManager
        .getData<List<Employee>, Employee>("127.0.0.1:8080", "/employee/managers", Employee(), null);
    return result.data;
  }


  Future<EmployeeDetail?> getEmployeeDetail(int id) async {
    ResponseModel<EmployeeDetail?> result = await networkManager
        .getData<EmployeeDetail, EmployeeDetail>("127.0.0.1:8080", "/employee/$id", EmployeeDetail(), null);
    return result.data;
  }

  Future<EmployeeDetail?> updateEmployee(EmployeeDetail employeeDetail) async {
    ResponseModel<EmployeeDetail?> result = await networkManager
        .putData<EmployeeDetail, EmployeeDetail>("127.0.0.1:8080", "/employee", EmployeeDetail(), json.encode(employeeDetail.toJson()) , null);
    return result.data;
  }

  Future<EmployeeDetail?> create(EmployeeDetail employeeDetail) async {
    ResponseModel<EmployeeDetail?> result = await networkManager
        .postData<EmployeeDetail, EmployeeDetail>("127.0.0.1:8080", "/employee", EmployeeDetail(), json.encode(employeeDetail.toJson()) , null);
    return result.data;
  }
}
