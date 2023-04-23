import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/shift.dart';
import 'package:admin_ui/screen/service/shift_service.dart';
import 'package:mobx/mobx.dart';
part 'shift_view_model.g.dart';

class ShiftViewModel = _ShiftViewModelBase with _$ShiftViewModel;

abstract class _ShiftViewModelBase with Store {
  final ShiftService shiftService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Shift>? shiftList;

  _ShiftViewModelBase(this.shiftService);

  @action
  init() async {
    shiftList = await shiftService.getShifts();
    if (shiftList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }
}
