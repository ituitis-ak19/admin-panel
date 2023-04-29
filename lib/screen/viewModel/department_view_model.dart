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

  @observable
  List<Department>? departments;

  _DepartmentViewModelBase(this.departmentService);

  @action
  init() async {
    departments = await departmentService.getDepartments();
    departmentList = departments;
    if (departmentList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

   @action
  filter(name){
    departmentList = departments?.where((department) => department.name!.toLowerCase().startsWith(name.toLowerCase())).toList();
  }
}
