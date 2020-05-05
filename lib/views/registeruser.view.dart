import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tennis_play_all/controllers/user.controller.dart';
import 'package:tennis_play_all/models/user.model.dart';
import 'package:tennis_play_all/repositories/user.repository.dart';
import 'package:tennis_play_all/view-models/registeruser.view-model.dart';
import 'phone.view.dart';

class RegisterUser extends StatefulWidget {
  // TO-DO: create rotines to validate inputs.
  @override
  State<StatefulWidget> createState() {
    return _RegisterUserState();
  }
}

class _RegisterUserState extends State<RegisterUser> {
  //inicio do código para se usar o dropdownbutton
  List<dynamic> _listGender = ["Selecione o Genero", "Masculino", "Feminino"];
  List<dynamic> _listPlayerLevel = [
    "Selecione nivel jogador",
    "ITN 10.1 a 10.3 - Iniciante",
    "ITN 10 a 8 - Recreativo",
    "ITN 7 a 5 - Intermediario",
    "ITN 4 a 2 - Avançado",
    "ITN 1 - Alto Desempenho"
  ];
  List<DropdownMenuItem<String>> _dropDownMenuItemsGender;
  List<DropdownMenuItem<String>> _dropDownMenuItemsPlayerLevel;
  String _currentGender;
  String _currentPlayerLevel;
  TextEditingController _email = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  // TO-DO: data de nascimento e controller.
  TextEditingController _address = new TextEditingController();
  TextEditingController _cep = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  // TO-DO: repetir senha, controller e validação entre senhas.

  RegisterUserViewModel _registerUserViewModel = RegisterUserViewModel();
  UserController _userController = UserController(UserRepository());

  @override
  void initState() {
    _dropDownMenuItemsGender = getDropDownMenuItemsGender();
    _dropDownMenuItemsPlayerLevel = getDropDownMenuItemsPlayer();
    _currentGender = _dropDownMenuItemsGender[0].value;
    _currentPlayerLevel = _dropDownMenuItemsPlayerLevel[0].value;
    super.initState();
  }

  void _changedDropDownItemGender(String selectedGender) {
    setState(() {
      _currentGender = selectedGender;
    });
  }

  void changedDropDownItemPlayer(String selectedPlayerLevel) {
    setState(() {
      _currentPlayerLevel = selectedPlayerLevel;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsGender() {
    List<DropdownMenuItem<String>> itemsGender = new List();
    for (String gender in _listGender) {
      itemsGender
          .add(new DropdownMenuItem(value: gender, child: new Text(gender)));
    }
    return itemsGender;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsPlayer() {
    List<DropdownMenuItem<String>> itemsPlayerLevel = new List();
    for (String playerlevel in _listPlayerLevel) {
      itemsPlayerLevel.add(new DropdownMenuItem(
          value: playerlevel, child: new Text(playerlevel)));
    }
    return itemsPlayerLevel;
  }
  //Fim do código para se usar o dropdownbutton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          Container(
            height: 60,
            width: 60,
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
                size: 40,
                color: Colors.green,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Container(
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
        ),
        child: ListView(
          children: <Widget>[
            // container do topo da tela
            Container(
              width: 128,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
              ),
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
              ),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Text(
                    "CADASTRO DE DADOS DO USUARIO",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            // Container do campo genero
            Container(
              width: 128,
              height: MediaQuery.of(context).size.height * 1.2,
              padding: EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  //topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      DropdownButton(
                        isExpanded: true,
                        style: TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        value: _currentGender,
                        items: _dropDownMenuItemsGender,
                        onChanged: _changedDropDownItemGender,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Container do campo Nivel do Jogador
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      DropdownButton(
                        isExpanded: true,
                        style: TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        value: _currentPlayerLevel,
                        items: _dropDownMenuItemsPlayerLevel,
                        onChanged: changedDropDownItemPlayer,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container do campo do nome completo
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome Completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Container do campo e-mail
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    //controller: email,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E-mail',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container do campo data de nascimento
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Data de Nascimento',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // COntainer do campo de Endereço
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    controller: _address,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Endereço Completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Container do campo de CEP
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    controller: _cep,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'CEP',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Container do campo de Senha
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nova senha',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.green[50],
                  ),
                  child: TextField(
                    //controller: email,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Digite a senha novamente',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _registerUserViewModel.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.green),
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
                                  "Avançar",
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
                          
                              // TO-DO: refatorar para invocar método de construção e tratar demais atributos de User.
                              // TO-DO: IF todos os inputs estão válidos THEN
                              // TO-DO: Trazer POST em USER quando a view Phone Page ficar pronta.
                              // TO-DO: inviabilizar /t (por exemplo) em campos de input.
                               setState(() {
                                _registerUserViewModel.busy = true;
                              });

                              _registerUserViewModel.email = _email.text;
                              _registerUserViewModel.password = _password.text;
                              _registerUserViewModel.name = _name.text;
                              _registerUserViewModel.cep = _cep.text;
                              _registerUserViewModel.address = _address.text;

                              _userController
                                  .post(_registerUserViewModel)
                                  .then((data) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhonePage(),
                                    ));
                              }).catchError((data) {
                                Fluttertoast.showToast(
                                    msg: "Erro ao cadastrar dados");
                              }).whenComplete(() {
                                setState(() {
                                  _registerUserViewModel.busy = false;
                                });
                              });
                              

                              // TO-DO: ENDIF
                              // UserModel _user = UserModel();
                              // _user.setStrDisplayName = _name.text.toLowerCase();
                              // _user.setStrLogin = _email.text.toLowerCase();
                              // _user.setStrPassword = _password.text;
                              // _user.setStrAddress = _address.text.toLowerCase();

                              // // TO-DO: invocar POST em USER só depois da PhonePage.
                              // if (await _registerUser(_user)) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => PhonePage(),
                              //     ),
                              //   );
                              // } else {
                              //   Fluttertoast.showToast(
                              //       msg: "Erro ao cadastrar dados");
                              // }
                            },
                          ),
                        ),
                      ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  // Future<bool> _registerUser(UserModel _userModel) async {

  //   Service _service = Service.instance;

  //   bool _status = false;

  //   // TO-DO: validar quando a API estiver funcionando ou buscar o novo payload que ainda não foi enviado.
  //   try{
  //     _status = json.decode(await _service.post(_userModel.toJson(), '/user')) == null ? false : true;
  //   } catch (_){
  //     _status = false;
  //   }

  //   return _status;

  // }

}
