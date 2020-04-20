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
}
