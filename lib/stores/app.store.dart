import 'dart:ffi';

import 'package:mobx/mobx.dart';

part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store{
  
  @observable
  String strLogin;

  @observable
  String strPassword;
  
  @observable
  String strDisplayName;
  
  @observable
  String strLevelPlay;
  
  @observable
  Double dblAddressLat;
  
  @observable
  Double dblAddressLong;

  void setUser(String login, String password, String displayName, String levelPlay, Double addressLat, Double addressLong){
    strLogin = login;
    strPassword = password;
    strDisplayName = displayName;
    strLevelPlay = levelPlay;
    dblAddressLat = addressLat;
    dblAddressLong = addressLong;

  }

}