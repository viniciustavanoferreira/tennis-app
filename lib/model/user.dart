import 'dart:ffi';

class User {
  //variables
  int intId;
  int intZipCode;
  int intActive;
  String strLogin;
  String strPassword;
  String strDisplayName;
  String strGender;
  String strAddress;
  String strRegion;
  String strPhoneNumber;
  String strBirthDate;
  String strLevelPlay;
  Double dblAddressLat;
  Double dblAddressLong;

  // método construtor da classe
  User(
      {this.intId,
      this.intZipCode,
      this.intActive,
      this.strLogin,
      this.strPassword,
      this.strDisplayName,
      this.strGender,
      this.strAddress,
      this.strRegion,
      this.strPhoneNumber,
      this.strBirthDate,
      this.strLevelPlay,
      this.dblAddressLat,
      this.dblAddressLong});

  // Método que pega os dados do arquivo Json
  User.fromJsonUser(Map<String, dynamic> json) {
    this.intId = json['id'];
    this.intZipCode = json['user_zip_code'];
    this.intActive = json['user_active'];
    this.strLogin = json['user_login'];
    this.strPassword = json['user_password'];
    this.strDisplayName = json['user_display_name'];
    this.strGender = json['user_gender'];
    this.strAddress = json['user_address'];
    this.strRegion = json['user_region'];
    this.strPhoneNumber = json['user_phone_number'];
    this.strBirthDate = json['user_birth_date'];
    this.strLevelPlay = json['user_level_play'];
    this.dblAddressLat = json['user_address_lat'];
    this.dblAddressLong = json['user_address_long'];
  }

  //Método que constroi o arquivo Json
  Map<String, dynamic> toJsonUser() {
    final Map<String, dynamic> dataUser = new Map<String, dynamic>();
    dataUser['id'] = this.intId;
    dataUser['user_zip_code'] = this.intZipCode;
    dataUser['user_active'] = this.intActive;
    dataUser['user_login'] = this.strLogin;
    dataUser['user_password'] = this.strPassword;
    dataUser['user_display_name'] = this.strDisplayName;
    dataUser['user_gender'] = this.strGender;
    dataUser['user_address'] = this.strAddress;
    dataUser['user_region'] = this.strRegion;
    dataUser['user_phone_number'] = this.strPhoneNumber;
    dataUser['user_birth_date'] = this.strBirthDate;
    dataUser['user_level_play'] = this.strLevelPlay;
    dataUser['user_address_lat'] = this.dblAddressLat;
    dataUser['user_address_long'] = this.dblAddressLong;
    return dataUser;
  }

  int get getIntId => intId;

  set setIntId(int intId) => this.intId = intId;

  int get getIntZipCode => intZipCode;

  set setIntZipCode(int intZipCode) => this.intZipCode = intZipCode;

  int get getIntActive => intActive;

  set setIntActive(int intActive) => this.intActive = intActive;

  String get getStrLogin => strLogin;

  set setStrLogin(String strLogin) => this.strLogin = strLogin;

  String get getStrPassword => strPassword;

  set setStrPassword(String strPassword) => this.strPassword = strPassword;

  String get getStrDisplayName => strDisplayName;

  set setStrDisplayName(String strDisplayName) =>
      this.strDisplayName = strDisplayName;

  String get getStrGender => strGender;

  set setStrGender(String strGender) => this.strGender = strGender;

  String get getStrAddress => strAddress;

  set setStrAddress(String strAddress) => this.strAddress = strAddress;

  String get getStrRegion => strRegion;

  set setStrRegion(String strRegion) => this.strRegion = strRegion;

  String get getStrPhoneNumber => strPhoneNumber;

  set setStrPhoneNumber(String strPhoneNumber) =>
      this.strPhoneNumber = strPhoneNumber;

  String get getStrBirthDate => strBirthDate;

  set setStrBirthDate(String strBirthDate) => this.strBirthDate = strBirthDate;

  String get getStrLevelPlay => strLevelPlay;

  set setStrLevelPlay(String strLevelPlay) => this.strLevelPlay = strLevelPlay;
}
