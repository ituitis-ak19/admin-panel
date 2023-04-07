import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/department.dart';
import 'package:admin_ui/screen/service/department_service.dart';
import 'package:mobx/mobx.dart';
part 'department_view_model.g.dart';

class DepartmentViewModel = _DepartmentViewModelBase with _$DepartmentViewModel;

abstract class _DepartmentViewModelBase with Store {
  final DepartmentService departmentService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Department>? departmentList;

  _DepartmentViewModelBase(this.departmentService);

  @action
  init() async {
    departmentList = await departmentService.getDepartments();
    if (departmentList != null && departmentList!.isNotEmpty) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }
}
