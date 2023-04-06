// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/employee.dart';

class EmployeeService {
  NetworkManager networkManager;
  EmployeeService({
    required this.networkManager,
  });

  Future<List<Employee>?> getEmployees() async {
    ResponseModel<List<Employee>> result =
        await networkManager.getData<List<Employee>, Employee>(
            "localhost:8080/employee", Employee(), null);
    return result.data;
  }
}