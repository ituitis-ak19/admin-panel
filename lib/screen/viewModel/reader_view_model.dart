import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/reader.dart';
import 'package:admin_ui/screen/service/reader_service.dart';
import 'package:mobx/mobx.dart';
part 'reader_view_model.g.dart';

class ReaderViewModel = _ReaderViewModelBase with _$ReaderViewModel;

abstract class _ReaderViewModelBase with Store {
  final ReaderService readerService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Reader>? readerList;

  @observable
  List<Reader>? readers;

  _ReaderViewModelBase(this.readerService);

  @action
  init() async {
    readers = await readerService.getReaders();
    readerList = readers;
    if (readerList != null) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }

  @action
  filter(name){
    readerList = readers?.where((reader) => reader.name!.startsWith(name)).toList();
  }
}
