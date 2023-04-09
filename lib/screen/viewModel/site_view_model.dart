import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:admin_ui/screen/model/site.dart';
import 'package:admin_ui/screen/service/site_service.dart';
import 'package:mobx/mobx.dart';
part 'site_view_model.g.dart';

class SiteViewModel = _SiteViewModelBase with _$SiteViewModel;

abstract class _SiteViewModelBase with Store {
  final SiteService siteService;

  @observable
  DataState dataState = DataState.LOADING;

  @observable
  List<Site>? siteList;

  _SiteViewModelBase(this.siteService);

  @action
  init() async {
    siteList = await siteService.getSites();
    if (siteList != null && siteList!.isNotEmpty) {
      dataState = DataState.READY;
    } else {
      dataState = DataState.ERROR;
    }
  }
}
