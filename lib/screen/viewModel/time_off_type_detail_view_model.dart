import 'package:admin_ui/screen/model/time_off_type.dart';
import 'package:admin_ui/screen/service/time_off_type_service.dart';
import 'package:admin_ui/screen/viewModel/time_off_type_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../core/constant/enum/enums.dart';
part 'time_off_type_detail_view_model.g.dart';

class TimeOffTypeDetailViewModel = _TimeOffTypeDetailViewModelBase with _$TimeOffTypeDetailViewModel;

abstract class _TimeOffTypeDetailViewModelBase with Store {
  final TimeOffTypeService timeOffTypeService;
  final int? id;
  final BuildContext buildContext;
  List<TextEditingController> textEditingControllerList = [];
  

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  TimeOffType? timeOffType;

  _TimeOffTypeDetailViewModelBase(this.timeOffTypeService, this.id, this.buildContext);

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
  Future<bool> updateTimeOffType() async{
    timeOffType!.name = textEditingControllerList[0].text;
    timeOffType!.description = textEditingControllerList[1].text;
    TimeOffType? updatedTimeOffType;
    dataState = DataState.LOADING;
    if(timeOffType!.id != null){
      updatedTimeOffType = await timeOffTypeService.updateTimeOffType(timeOffType!);
      if(updatedTimeOffType != null){
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin Tipi başarıyla güncellendi")));
      return true;
    }
    else{
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin Tipi güncellenirken bir hata meydana geldi")));
        
    }
    }
    else{
      updatedTimeOffType = await timeOffTypeService.create(timeOffType!);
      if(updatedTimeOffType != null){
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin Tipi başarıyla oluşturuldu")));
      return true;
    }
    else{
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin Tipi oluştururken bir hata meydana geldi")));
    }
    }
  dataState = DataState.READY;
  return false;
    
  }
  
}