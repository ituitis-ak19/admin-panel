import 'package:admin_ui/screen/model/department_detail.dart';
import 'package:admin_ui/screen/model/employee.dart';
import 'package:admin_ui/screen/service/department_service.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../model/employee_detail.dart';
part 'department_detail_view_model.g.dart';

class DepartmentDetailViewModel = _DepartmentDetailViewModelBase with _$DepartmentDetailViewModel;

abstract class _DepartmentDetailViewModelBase with Store {
  final DepartmentService departmentService;
  final EmployeeService employeeService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  DepartmentDetail? departmentDetail;

  @observable
  List<Employee>? employeeList;

  @observable
  List<EmployeeDetail>? managersToSign = [];

  @observable
  int? employeeId;

  @observable
  EmployeeDetail? manager;

  @observable
  DataState employeeListDataState = DataState.READY;

  _DepartmentDetailViewModelBase(this.departmentService, this.id, this.employeeService);

  @action
  init() async {
    if(id == null){
      departmentDetail = DepartmentDetail();
    }
    else{
      departmentDetail = await departmentService.getDepartmentDetail(id!);
      manager = await employeeService.getEmployeeDetail(departmentDetail!.managerId!);
      await initManagerToSign();
    }
    textEditingControllerList.add(TextEditingController(text: departmentDetail!.name));
    employeeList = await employeeService.getEmployees();
    if (departmentDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  initManagerToSign() async {
    employeeListDataState = DataState.LOADING;
    departmentDetail!.managersToSignIds?.forEach((element) async {
        EmployeeDetail? managerToSign = await employeeService.getEmployeeDetail(element);
        managersToSign?.add(managerToSign!);});
    employeeListDataState = DataState.READY;
  }

  @action
  changeEmployeeId(int value){
    employeeId = value;
  }

  @action
  addEmployee(int value) async{
    employeeListDataState = DataState.LOADING;
    EmployeeDetail? addedManager = await employeeService.getEmployeeDetail(value);
      if(!departmentDetail!.managersToSignIds!.contains(value)){
        departmentDetail!.managersToSignIds!.add(value);
        managersToSign?.add(addedManager!);
      } 
    employeeListDataState = DataState.READY;
  }

  @action
  removeEmployee(int value) async{
    employeeListDataState = DataState.LOADING;
    managersToSign!.removeWhere((element) => element.id == value);
    departmentDetail!.managersToSignIds!.remove(value);
    employeeListDataState = DataState.READY;
  }

  @action
  updateDepartment() async {
    departmentDetail!.name = textEditingControllerList[0].text;
    departmentService.updateDepartment(departmentDetail!);
  }

}