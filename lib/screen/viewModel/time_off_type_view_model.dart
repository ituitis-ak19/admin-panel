import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/time_off_type.dart';
import 'package:admin_ui/screen/service/time_off_type_service.dart';
import 'package:mobx/mobx.dart';
part 'time_off_type_view_model.g.dart';

class TimeOffTypeViewModel = _TimeOffTypeViewModelBase with _$TimeOffTypeViewModel;

abstract class _TimeOffTypeViewModelBase with Store {
  final TimeOffTypeService siteService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<TimeOffType>? timeOffTypeList;

  @observable
  List<TimeOffType>? timeOffTypes;

  _TimeOffTypeViewModelBase(this.siteService);

  @action
  init() async {
    timeOffTypes = await siteService.getTimeOffTypes();
    timeOffTypeList = timeOffTypes;
    if (timeOffTypeList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

  @action
  filter(name){
    timeOffTypeList = timeOffTypes?.where((timeOffType) => timeOffType.name!.toLowerCase().startsWith(name.toLowerCase)).toList();
  }
}
