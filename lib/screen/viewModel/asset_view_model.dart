import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/asset.dart';
import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:mobx/mobx.dart';
part 'asset_view_model.g.dart';

class AssetViewModel = _AssetViewModelBase with _$AssetViewModel;

abstract class _AssetViewModelBase with Store {
  final AssetService assetService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Asset>? assetList;

  @observable
  List<Asset>? assets;

  _AssetViewModelBase(this.assetService);

  @action
  init() async {
    assets =  await assetService.getAssets();
    assetList = assets;
    if (assetList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

   @action
  filter(name){
    assetList = assets?.where((asset) => asset.name!.startsWith(name)).toList();
  }
}
