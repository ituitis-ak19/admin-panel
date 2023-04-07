// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/reader.dart';

class ReaderService {
  NetworkManager networkManager;
  ReaderService({
    required this.networkManager,
  });

  Future<List<Reader>?> getReaders() async {
    ResponseModel<List<Reader>> result = await networkManager
        .getData<List<Reader>, Reader>("127.0.0.1:8080", "/reader", Reader(), null);
    return result.data;
  }
}
