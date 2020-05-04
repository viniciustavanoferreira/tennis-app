import 'package:provider/provider.dart';
import 'package:tennis_play_all/controllers/login.controller.dart';
import 'package:tennis_play_all/models/user.model.dart';
import 'package:tennis_play_all/repositories/login.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennis_play_all/repositories/user.repository.dart';
import 'package:tennis_play_all/stores/app.store.dart';
import 'package:tennis_play_all/view-models/login.view-model.dart';
import 'home.view.dart';
import 'forgotpassword.view.dart';
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

  LoginController _loginController = LoginController(LoginRepository());
  LoginViewModel _loginViewModel = LoginViewModel();
  UserModel _userModel;
  AppStore _appStore;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appStore = Provider.of<AppStore>(context);
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
                  _loginViewModel.busy
                      ? Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        )
                      : Container(
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
                                  _isEmailValid = _loginController
                                      .validateEmail(_email.text);
                                  _isPasswordValid = _loginController
                                      .validatePassword(_password.text);
                                });

                                if (_isEmailValid && _isPasswordValid) {
                                  setState(() {
                                    _loginViewModel.login = _email.text;
                                    _loginViewModel.password = _password.text;
                                    _loginViewModel.busy = true;
                                  });
                                  try {
                                    _userModel = await _loginController
                                        .post(_loginViewModel);

                                    _appStore.setUser(
                                        _userModel.getStrLogin,
                                        _userModel.getStrPassword,
                                        _userModel.getStrDisplayName,
                                        _userModel.getStrLevelPlay,
                                        _userModel.getdblAddressLat,
                                        _userModel.getdblAddressLong);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                        msg: "Usuário e/ou senha inválidos.");
                                  }

                                  setState(() {
                                    _loginViewModel.busy = false;
                                  });
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
}
