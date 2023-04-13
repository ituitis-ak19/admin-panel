import 'package:admin_ui/screen/model/time_off_type.dart';
import 'package:admin_ui/screen/service/time_off_type_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../core/constant/enum/enums.dart';
part 'time_off_type_detail_view_model.g.dart';

class TimeOffTypeDetailViewModel = _TimeOffTypeDetailViewModelBase with _$TimeOffTypeDetailViewModel;

abstract class _TimeOffTypeDetailViewModelBase with Store {
  final TimeOffTypeService timeOffTypeService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  TimeOffType? timeOffType;

  _TimeOffTypeDetailViewModelBase(this.timeOffTypeService, this.id);

  @action
  init() async {
    if(id == null){
      timeOffType = TimeOffType();
    }
    else{
      timeOffType = await timeOffTypeService.getTimeOffTypeDetail(id!);
    }
    
    textEditingControllerList.add(TextEditingController(text: timeOffType!.name));
    textEditingControllerList.add(TextEditingController(text: timeOffType!.description));

    if (timeOffType != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  updateTimeOffType() async{
    timeOffType!.name = textEditingControllerList[0].text;
    timeOffType!.description = textEditingControllerList[1].text;
    timeOffTypeService.updateTimeOffType(timeOffType!);
  }
  
}