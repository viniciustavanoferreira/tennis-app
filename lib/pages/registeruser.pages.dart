import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterUserState();
  }
}

class _RegisterUserState extends State<RegisterUser> {
  List<dynamic> listGender = ["Selecione o Genero", "Masculino", "Feminino"];
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentGender;

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentGender = dropDownMenuItems[0].value;
    super.initState();
  }

  void changedDropDownItem(String selectedGender) {
    setState(() {
      currentGender = selectedGender;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String gender in listGender) {
      items.add(new DropdownMenuItem(value: gender, child: new Text(gender)));
    }
    return items;
  }

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

            Container(
              width: 128,
              height: MediaQuery.of(context).size.height * 0.9,
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      DropdownButton(
                        isExpanded: true,
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        value: currentGender,
                        items: dropDownMenuItems,
                        onChanged: changedDropDownItem,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome completo',
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black12,
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      DropdownButton(
                        isExpanded: true,
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        value: currentGender,
                        items: dropDownMenuItems,
                        onChanged: changedDropDownItem,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
