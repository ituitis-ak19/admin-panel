// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_ui/screen/model/access_location_detail.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:admin_ui/screen/service/access_location_service.dart';
import 'package:admin_ui/screen/service/site_service.dart';

import '../../core/constant/enum/enums.dart';
import '../model/site.dart';

part 'access_location_detail_view_model.g.dart';

class AccessLocationDetailViewModel = _AccessLocationDetailViewModelBase with _$AccessLocationDetailViewModel;

abstract class _AccessLocationDetailViewModelBase with Store {
  final AccessLocationService accessLocationService;
  final SiteService siteService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Site>? siteList;

  @observable
  AccessLocationDetail? accessLocationDetail;


  _AccessLocationDetailViewModelBase(
    this.accessLocationService,
    this.siteService,
    this.id
  );

  @action
  init() async {
    siteList = await siteService.getSites();

     if(id == null){
      accessLocationDetail = AccessLocationDetail();
    }
    else{
      accessLocationDetail = await accessLocationService.getAccessLocationDetail(id!);
    }
    textEditingControllerList.add(TextEditingController(text: accessLocationDetail!.name));
    textEditingControllerList.add(TextEditingController(text: accessLocationDetail!.type.toString()));
    textEditingControllerList.add(TextEditingController(text: accessLocationDetail!.location));
    if (accessLocationDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }
  
  @action
  updateAccessLocation() async{
    accessLocationDetail!.name = textEditingControllerList[0].text;
    accessLocationDetail!.type = int.parse(textEditingControllerList[1].text);
    accessLocationDetail!.location = (textEditingControllerList[2].text);
    accessLocationService.updateAccessLocation(accessLocationDetail!);
  }
}
