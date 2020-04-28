import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'phone.pages.dart';

class RegisterUser extends StatefulWidget {
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

  @override
  void initState() {
    _dropDownMenuItemsGender = getDropDownMenuItemsGender();
    _dropDownMenuItemsPlayerLevel = getDropDownMenuItemsPlayer();
    _currentGender = _dropDownMenuItemsGender[0].value;
    _currentPlayerLevel = _dropDownMenuItemsPlayerLevel[0].value;
    super.initState();
  }

  void changedDropDownItemGender(String selectedGender) {
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
                        onChanged: changedDropDownItemGender,
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
                    //controller: email,
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
                //Contatiner do campo e-mail
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
                    //controller: email,
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
                    //controller: email,
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
                    //controller: email,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhonePage(),
                          ),
                        );
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
}
