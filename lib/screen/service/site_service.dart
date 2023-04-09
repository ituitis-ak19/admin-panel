// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/site.dart';

class SiteService {
  NetworkManager networkManager;
  SiteService({
    required this.networkManager,
  });

  Future<List<Site>?> getSites() async {
    ResponseModel<List<Site>> result = await networkManager
        .getData<List<Site>, Site>("127.0.0.1:8080", "/site", Site(), null);
    return result.data;
  }
}
