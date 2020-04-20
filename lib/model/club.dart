import 'dart:ffi';

class Club {
  //variables
  int intId;
  int intZipCode;
  String strName;
  String strAddress;
  String strCity;
  String strRegion;
  String strPhoneNumber;
  Double dblAddressLat;
  Double dblAddressLong;

  // método construtor da classe
  Club(
      {this.intId,
      this.intZipCode,
      this.strName,
      this.strAddress,
      this.strCity,
      this.strRegion,
      this.strPhoneNumber,
      this.dblAddressLat,
      this.dblAddressLong});

  // Método que pega os dados do arquivo Json do club
  Club.fromJsonClub(Map<String, dynamic> json) {
    this.intId = json['id'];
    this.intZipCode = json['club_zip_code'];
    this.strName = json['club_name'];
    this.strAddress = json['club_address'];
    this.strCity = json['club_city'];
    this.strRegion = json['club_region'];
    this.strPhoneNumber = json['club_phone_number'];
    this.dblAddressLat = json['club_address_lat'];
    this.dblAddressLong = json['club_address_long'];
  }

  //Método que constroi o arquivo Json do club
  Map<String, dynamic> toJsonClub() {
    final Map<String, dynamic> dataClub = new Map<String, dynamic>();
    dataClub['id'] = this.intId;
    dataClub['club_zip_code'] = this.intZipCode;
    dataClub['club_name'] = this.strName;
    dataClub['club_address'] = this.strAddress;
    dataClub['club_city'] = this.strCity;
    dataClub['club_region'] = this.strRegion;
    dataClub['club_phone_number'] = this.strPhoneNumber;
    dataClub['club_address_lat'] = this.dblAddressLat;
    dataClub['club_address_long'] = this.dblAddressLong;
    return dataClub;
  }
}
