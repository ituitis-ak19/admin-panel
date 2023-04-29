import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../model/time_off.dart';
import '../service/time_off_service.dart';
part 'time_off_view_model.g.dart';

class TimeOffViewModel = _TimeOffViewModelBase with _$TimeOffViewModel;

abstract class _TimeOffViewModelBase with Store {
  final TimeOffService timeOffService;
  final BuildContext buildContext;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<TimeOff>? timeOffList;

  @observable
  List<TimeOff>? timeOffs;

  _TimeOffViewModelBase(this.timeOffService, this.buildContext);

  @action
  init() async {
    timeOffs = await timeOffService.getTimeOffs();
    timeOffList = timeOffs;
    if (timeOffList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

  @action
  filter(name){
    timeOffList = timeOffs?.where((timeOff) => timeOff.firstName!.toLowerCase().startsWith(name.toLowerCase())).toList();
  }

  @action
  Future<bool> signTimeOff(int id) async {
    dataState = DataState.LOADING;
    TimeOff? signedTimeOff;
    signedTimeOff = await timeOffService.signTimeOff(id);
    if(signedTimeOff != null){
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin başarıyla imzalandı")));
      return true;
    }
      dataState = DataState.READY;
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text("İzin imzalanırken bir hata meydana geldi")));
      return false;
  }
 }
