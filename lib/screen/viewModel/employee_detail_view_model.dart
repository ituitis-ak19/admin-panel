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
import '../model/shift.dart';
import '../service/shift_service.dart';
part 'employee_detail_view_model.g.dart';

class EmployeeDetailViewModel= _EmployeeDetailViewModelBase with _$EmployeeDetailViewModel;

abstract class _EmployeeDetailViewModelBase with Store {
  final EmployeeService employeeService;
  final DepartmentService departmentService;
  final SiteService siteService;
  final ShiftService shiftService;
  final int? id;
  final BuildContext buildContext;
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
  List<Shift>? shiftList;
  
  @observable
  DataState siteListDataState = DataState.READY;

  @observable
  bool? isManagerObservable;

  @observable
  int? siteId;

  _EmployeeDetailViewModelBase(this.employeeService, this.id, this.departmentService, this.siteService, this.buildContext, this.shiftService);

  @action
  init() async {
    departmentList = await departmentService.getDepartments();
    siteList = await siteService.getSites();
    shiftList = await shiftService.getShifts();
    
    if(id == null){
      employeeDetail = EmployeeDetail();
      employeeDetail!.siteList = <Site> [];
    }
    else{
      employeeDetail = await employeeService.getEmployeeDetail(id!);
    }
    isManagerObservable = employeeDetail!.isManager;
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.firstName));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.lastName));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.email));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.identityNum != null ? employeeDetail!.identityNum.toString() : ""));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.birthDate));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.startDate));
    textEditingControllerList.add(TextEditingController(text: employeeDetail!.remainingTimeOffDays != null ? employeeDetail!.remainingTimeOffDays.toString() : ""));

    if (employeeDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  changeIsManager(bool value){
    isManagerObservable = value;
  }
  
  @action
  changeSiteId(int value){
    siteId = value;
  }

  @action
  addSite(int value) async{
    siteListDataState = DataState.LOADING;
    Site? site = await siteService.getSiteById(value);
    if(site != null){
      if(!employeeDetail!.siteList!.contains(site)){
        employeeDetail!.siteList!.add(site);
      } 
    }
    siteListDataState = DataState.READY;
  }

  @action
  removeSite(int value) async{
    siteListDataState = DataState.LOADING;
    employeeDetail!.siteList!.removeWhere((element) => element.id == value);
    siteListDataState = DataState.READY;
  }

  @action
  updateEmployee() async{
    employeeDetail!.firstName = textEditingControllerList[0].text;
    employeeDetail!.lastName = textEditingControllerList[1].text;
    employeeDetail!.email = textEditingControllerList[2].text;
    employeeDetail!.identityNum = textEditingControllerList[3].text != "" ? int.parse(textEditingControllerList[3].text) : null;
    employeeDetail!.birthDate = textEditingControllerList[4].text;
    employeeDetail!.startDate = textEditingControllerList[5].text;
    employeeDetail!.remainingTimeOffDays = textEditingControllerList[6].text != "" ? int.parse(textEditingControllerList[6].text) : null;
    employeeDetail!.isManager = isManagerObservable;
    EmployeeDetail? updatedEmployee;
    dataState = DataState.LOADING;
    if(employeeDetail!.id != null){
      updatedEmployee = await employeeService.updateEmployee(employeeDetail!);
      if(updatedEmployee != null){
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("Çalışan başarıyla güncellendi")));
      return true;
    }
    else{
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("Çalışan güncellenirken bir hata meydana geldi")));
        
    }
    }
    else{
      updatedEmployee = await employeeService.create(employeeDetail!);
      if(updatedEmployee != null){
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("Çalışan başarıyla oluşturuldu")));
      return true;
    }
    else{
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("Çalışan oluştururken bir hata meydana geldi")));
    }
    }
  dataState = DataState.READY;
  return false;
    
  }
  
}