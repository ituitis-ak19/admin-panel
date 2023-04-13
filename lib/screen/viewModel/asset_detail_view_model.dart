import 'package:admin_ui/screen/model/asset_detail.dart';
import 'package:admin_ui/screen/model/employee.dart';
import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../model/employee_detail.dart';
part 'asset_detail_view_model.g.dart';

class AssetDetailViewModel = _AssetDetailViewModelBase with _$AssetDetailViewModel;

abstract class _AssetDetailViewModelBase with Store {
  final AssetService assetService;
  final EmployeeService employeeService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  AssetDetail? assetDetail;

  @observable
  List<Employee>? employeeList;

  _AssetDetailViewModelBase(this.assetService, this.id, this.employeeService);

  @action
  init() async {
    if(id == null){
      assetDetail = AssetDetail();
    }
    else{
      assetDetail = await assetService.getAssetDetail(id!);
    }
    textEditingControllerList.add(TextEditingController(text: assetDetail!.name));
    textEditingControllerList.add(TextEditingController(text: assetDetail!.dateOfIssue));
    textEditingControllerList.add(TextEditingController(text: assetDetail!.description));
    employeeList = await employeeService.getEmployees();
    if (assetDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  updateAsset() async {
    assetDetail!.name = textEditingControllerList[0].text;
    assetDetail!.dateOfIssue = textEditingControllerList[1].text;
    assetDetail!.description = textEditingControllerList[2].text;
    assetService.updateAsset(assetDetail!);
  }

}