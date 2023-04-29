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
  List<Employee>? employeeList;

  @observable
  List<Employee>? employees;

  _EmployeeViewModelBase(this.employeeService);

  @action
  init() async {
    employees = await employeeService.getEmployees();
    employeeList = employees;
    if (employeeList != null && employeeList!.isNotEmpty) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

  @action
  filter(email){
    employeeList = employees?.where((employee) => employee.email!.toLowerCase().startsWith(email.toLowerCase())).toList();
  }
}
