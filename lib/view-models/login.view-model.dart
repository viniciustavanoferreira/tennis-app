import 'dart:convert';

class LoginViewModel {
  String _login = "";
  String _password = "";
  bool _busy = false;

  set login(String value) => _login = value;

  set password(String value) => _password = value;

  bool get busy => _busy;

  set busy(bool value) => _busy = value;

  String toJson() {
    final Map<String, dynamic> mapLogin = new Map<String, dynamic>();
    mapLogin['user_login'] = this._login;
    mapLogin['user_password'] = this._password;
    return jsonEncode(mapLogin);
  }
}
