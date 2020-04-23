/*
 void _checkLoginCredentials(
      TextEditingController email, TextEditingController password) {
    Service service = Service.instance;
    //TO-DO : instanciar usuário baseado no JSON retornado, além de tratar exceptions e httpReturnCode.
    Future<String> bodyResponse =
        service.post(this._loginToString(email, password), "/auth/login");
  }

  //TO-DO : refatorar essas implementações abaixo.
  Map<String, dynamic> _loginToJson(
      TextEditingController email, TextEditingController password) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_login'] = email.text;
    data['user_password'] = password.text;
    return data;
  }

  String _loginToString(
      TextEditingController email, TextEditingController password) {
    return ('{"user_login": "' +
        email.text +
        '", "user_password": "' +
        password.text +
        '"}');
  }
}
*/
