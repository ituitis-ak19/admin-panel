// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

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
}
