// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/time_off_type.dart';

class TimeOffTypeService {
  NetworkManager networkManager;
  TimeOffTypeService({
    required this.networkManager,
  });

  Future<List<TimeOffType>?> getTimeOffTypes() async {
    ResponseModel<List<TimeOffType>> result = await networkManager
        .getData<List<TimeOffType>, TimeOffType>("127.0.0.1:8080", "/timeOffType", TimeOffType(), null);
    return result.data;
  }
}
