class User{

  //variaveis
  Int user_id;
  String user_login;
  String user_password;
  String user_display_name;
  Float user_lat;
  Float user_long;

  // método construtor da classe
  User({this.user_id,this.user_login,this.user_password,this.user_display_name,this.user_lat, this.user_long});

  // Método que pega os dados do arquivo Json
  User.fromJson(Map<String, dynamic> json){
    this.user_id = json['id']
    this.userlogin = json['user_login'];
    this.user_password = json['user_password'];
    this.user_display_name = json['user_display_name'];
    this.user_lat = json['user_lat'];
    this.user_long = json['user_long'];
  }
  
  //Método que constroi o arquivo Json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['user_login'] = this.user_login;
    data['user_password'] = this.user_password;
    data['user_display_name'] = this.user_display_name;
    data['user_lat'] = this.user_lat;
    data['user_long'] = this.user_long;
    return data;
  }

}