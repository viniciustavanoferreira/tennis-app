import 'package:flutter/material.dart';
import 'registeruser.view.dart';
import 'login.view.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            // container do topo da tela
            Container(
              width: 128,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.only(
                top: 60,
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
                  height: 128,
                  width: 128,
                  child: Image.asset("assets/logo_branco.png"),
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 200,
                  child: Text(
                    "UMA REDE DE CLUBES\nE JOGADORES DE TENNIS",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 128,
              padding: EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    child: Text(
                      "ENCONTRE OUTROS JOGADORES",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
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
                              "Cadastre-se",
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
                              builder: (context) => RegisterUser(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "OU",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "ENTRAR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
