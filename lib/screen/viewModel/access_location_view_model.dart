import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/access_location.dart';
import 'package:admin_ui/screen/service/access_location_service.dart';
import 'package:mobx/mobx.dart';
part 'access_location_view_model.g.dart';

class AccessLocationViewModel = _AccessLocationViewModelBase with _$AccessLocationViewModel;

abstract class _AccessLocationViewModelBase with Store {
  final AccessLocationService accessLocationService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<AccessLocation>? accessLocationList;

  @observable
  List<AccessLocation>? accessLocations;

  _AccessLocationViewModelBase(this.accessLocationService);

  @action
  init() async {
    accessLocations = await accessLocationService.getAccessLocations();
    accessLocationList = accessLocations;
    
    if (accessLocationList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }
  
  @action
  filter(name){
    accessLocationList = accessLocations?.where((accessLocation) => accessLocation.name!.toLowerCase().startsWith(name.toLowerCase())).toList();
  }
}
