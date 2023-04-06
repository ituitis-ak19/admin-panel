import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/employee.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:mobx/mobx.dart';
part 'employee_view_model.g.dart';

class EmployeeViewModel = _EmployeeViewModelBase with _$EmployeeViewModel;

abstract class _EmployeeViewModelBase with Store {

  final EmployeeService employeeService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  late List<Employee>? employeeList;

  _EmployeeViewModelBase(this.employeeService);

  @action
  init() async {
    employeeList = await employeeService.getEmployees();
    if(employeeList != null && employeeList!.isNotEmpty){
      dataState = DataState.READY;
    }
    else{
      dataState = DataState.ERROR;
    }
  }

  
  
}