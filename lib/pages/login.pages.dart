import 'package:tennis_play_all/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.pages.dart';
import 'forgotpassword.pages.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF33691E),
                      Color(0xFF64DD17),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4.0,
                        color: const Color(0xFFFFFFFF),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 32,
                        right: 32,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.green[50],
                    ),
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorText: _isEmailValid ? null : 'E-mail inválido',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.green[50],
                    ),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorText:
                            _isPasswordValid ? null : 'Password inválido',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFF33691E),
                          Color(0xFF64DD17),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Logar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          setState(() {
                            // TO-DO: ou criar um método para cada tratativa, ou implementa o resto que falta das tratativas no mesmo método já criado.
                            // TO-DO: onChange, delete error msg.
                            // TO-DO: dimensionamento dos widgets comprometidos.
                            _isEmailValid = _validateEmail(_email.text);
                            // _isPasswordValid = _validatePassword(_password.text);
                          });

                          // if (_email.text == "" || _password.text == "") {
                          //   Fluttertoast.showToast(msg: "Preencha as informações de login.");
                          //   return;
                          // }

                          // TODO: aplicar animação de espera para o login; desativar botão de logar
                          if (await _checkLoginCredentials(_email, _password)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: "Usuário e/ou senha inválidos.");
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(),
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        "Esqueceu sua senha?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String text) {
    // TO-DO: case sensitive - adapt it.
    RegExp regex = new RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
    if (regex.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  bool _validatePassword(String text) {
    // TO-DO: try to avoid instantiate twice a regex's object.
    // Mínimo de 8 carac., ao menos 1 núm., 1 letra e 1 carac. especial.
    RegExp regex = new RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
    if (regex.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _checkLoginCredentials(
      TextEditingController _email, TextEditingController _password) async {

    Service _service = Service.instance;
    bool _status = false;

    try{
      _status = json.decode(await _service.post(_loginToString(_email.text, _password.text), '/auth/login')) == null ? false : true;
    } catch (_){
      _status = false;
    }

    return _status;

  }

  String _loginToString(String _email, String _password) {
    Map<String, dynamic> mapJson = {
      'user_login': _email,
      'user_password': _password,
    };

    return jsonEncode(mapJson);
  }
}
