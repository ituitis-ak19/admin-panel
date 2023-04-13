import 'package:admin_ui/screen/model/access_location.dart';
import 'package:admin_ui/screen/service/access_location_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../model/reader_detail.dart';
import '../service/reader_service.dart';
part 'reader_detail_view_model.g.dart';

class ReaderDetailViewModel = _ReaderDetailViewModelBase with _$ReaderDetailViewModel;

abstract class _ReaderDetailViewModelBase with Store {
  final ReaderService readerService;
  final AccessLocationService accessLocationService;
  final int? id;
  List<TextEditingController> textEditingControllerList = [];

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<AccessLocation>? accessLocationList;

  @observable
  ReaderDetail? readerDetail;

  _ReaderDetailViewModelBase(this.readerService, this.accessLocationService, this.id);

  @action
  init() async {
    accessLocationList = await accessLocationService.getAccessLocations();
    
    if(id == null){
      readerDetail = ReaderDetail();
    }
    else{
      readerDetail = await readerService.getReaderDetail(id!);
    }
    textEditingControllerList.add(TextEditingController(text: readerDetail!.name));
    textEditingControllerList.add(TextEditingController(text: readerDetail!.type.toString()));
    textEditingControllerList.add(TextEditingController(text: readerDetail!.direction.toString()));

    if (readerDetail != null) {
        dataState = DataState.READY;
      } else {
        dataState = DataState.ERROR;
      }
  }

  @action
  updateReader() async{
    readerDetail!.name = textEditingControllerList[0].text;
    readerDetail!.type = int.parse(textEditingControllerList[1].text);
    readerDetail!.direction = int.parse(textEditingControllerList[2].text);
    readerService.updateReader(readerDetail!);
  }
  
  
}