import 'package:admin_ui/core/network/network_manager.dart';
import 'package:mobx/mobx.dart';

abstract class BaseViewModel {
  NetworkManager networkManager = NetworkManager();
  void init();
}
