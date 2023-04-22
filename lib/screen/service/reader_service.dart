// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/reader.dart';
import '../model/reader_detail.dart';

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

  Future<ReaderDetail?> getReaderDetail(int id) async {
    ResponseModel<ReaderDetail?> result = await networkManager
        .getData<ReaderDetail, ReaderDetail>("127.0.0.1:8080", "/reader/$id", ReaderDetail(), null);
    return result.data;
  }

  Future<ReaderDetail?> updateReader(ReaderDetail readerDetail) async {
    ResponseModel<ReaderDetail?> result = await networkManager
        .putData<ReaderDetail, ReaderDetail>("127.0.0.1:8080", "/reader", ReaderDetail(), json.encode(readerDetail.toJson()) , null);
    return result.data;
  }

  Future<ReaderDetail?> create(ReaderDetail readerDetail) async {
    ResponseModel<ReaderDetail?> result = await networkManager
        .postData<ReaderDetail, ReaderDetail>("127.0.0.1:8080", "/reader", ReaderDetail(), json.encode(readerDetail.toJson()) , null);
    return result.data;
  }
}
