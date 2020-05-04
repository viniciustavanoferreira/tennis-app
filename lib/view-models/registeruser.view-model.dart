import 'dart:convert';

class RegisterUserViewModel {
  String _email;
  String _name;
  String _address;
  String _cep;
  String _password;
  bool _busy = false;

  set email(String value) => _email = value;

  set name(String value) => _name = value;

  set address(String value) => _address = value;

  set cep(String value) => _cep = value;

  set password(String value) => _password = value;

  set busy(bool value) => _busy = value;

  String toJson() {
    final Map<String, dynamic> mapLogin = new Map<String, dynamic>();
    mapLogin['user_login'] = this._email;
    mapLogin['user_password'] = this._password;
    mapLogin['user_display_name'] = this._name;
    mapLogin['user_cep'] = this._cep;
    mapLogin['user_address'] = this._address;
    return jsonEncode(mapLogin);
  }
}
