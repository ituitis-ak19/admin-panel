import 'dart:math';

import 'package:admin_ui/screen/model/department.dart';
import 'package:admin_ui/screen/model/employee_detail.dart';
import 'package:admin_ui/screen/model/site.dart';
import 'package:admin_ui/screen/service/department_service.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:admin_ui/screen/service/site_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/constant/enum/enums.dart';
part 'employee_detail_view_model.g.dart';

class EmployeeDetailViewModel= _EmployeeDetailViewModelBase with _$EmployeeDetailViewModel;

abstract class _EmployeeDetailViewModelBase with Store {
  final EmployeeService employeeService;
  final DepartmentService departmentService;
  final SiteService siteService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  EmployeeDetail? employeeDetail;

  @observable
  List<Department>? departmentList;

  @observable
  List<Site>? siteList;

  @observable
  bool? isManagerObservable;

  _EmployeeDetailViewModelBase(this.employeeService, this.id, this.departmentService, this.siteService);

  @action
  init() async {
    departmentList = await departmentService.getDepartments();
    siteList = await siteService.getSites();
    
    if(id == null){
      employeeDetail = EmployeeDetail();
    }
    else{
      employeeDetail = await employeeService.getEmployeeDetail(id!);
    }
    isManagerObservable = employeeDetail!.isManager!;
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.firstName));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.lastName));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.email));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.email));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.birthDate));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.startDate));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.remainingTimeOffDays.toString()));

    if (employeeDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  changeIsManager(){
    isManagerObservable = false;
  }
  
  
}