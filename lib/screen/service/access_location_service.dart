// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/screen/model/access_location.dart';


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
}
