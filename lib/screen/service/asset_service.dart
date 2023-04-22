// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_ui/core/network/model/response_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

import '../model/asset.dart';
import '../model/asset_detail.dart';

class AssetService {
  NetworkManager networkManager;
  AssetService({
    required this.networkManager,
  });

  Future<List<Asset>?> getAssets() async {
    ResponseModel<List<Asset>> result = await networkManager
        .getData<List<Asset>, Asset>("127.0.0.1:8080", "/product", Asset(), null);
    return result.data;
  }

  Future<AssetDetail?> getAssetDetail(int id) async {
    ResponseModel<AssetDetail?> result = await networkManager
        .getData<AssetDetail, AssetDetail>("127.0.0.1:8080", "/product/$id", AssetDetail(), null);
    return result.data;
  }

  Future<AssetDetail?> updateAsset(AssetDetail assetDetail) async {
    ResponseModel<AssetDetail?> result = await networkManager
        .putData<AssetDetail, AssetDetail>("127.0.0.1:8080", "/product", AssetDetail(), json.encode(assetDetail.toJson()) , null);
    return result.data;
  }

  Future<AssetDetail?> create(AssetDetail assetDetail) async {
    ResponseModel<AssetDetail?> result = await networkManager
        .postData<AssetDetail, AssetDetail>("127.0.0.1:8080", "/product", AssetDetail(), json.encode(assetDetail.toJson()) , null);
    return result.data;
  }
}
