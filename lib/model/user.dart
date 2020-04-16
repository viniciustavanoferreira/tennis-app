import 'dart:ffi';

class User{

  //variaveis
  int id;
  String login;
  String password;
  String displayName;
  Double latitude;
  Double longitude;

  // método construtor da classe
  User({this.id,this.login,this.password,this.displayName,this.latitude, this.longitude});

  // Método que pega os dados do arquivo Json
  User.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.login = json['login'];
    this.password = json['password'];
    this.displayName = json['displayName'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
  }
  
  //Método que constroi o arquivo Json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['password'] = this.password;
    data['displayName'] = this.displayName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  

}