// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  @observable
  int selectedIndex;

  _MainViewModelBase({
    required this.selectedIndex,
  });

  @action
  setSelectedIndex(int index){
    selectedIndex = index;
  }
}
