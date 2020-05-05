import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_play_all/stores/app.store.dart';
import 'registeruser.view.dart';
import 'login.view.dart';

class HomePage extends StatelessWidget {
  AppStore _appStore;

  @override
  Widget build(BuildContext context) {
    _appStore = Provider.of<AppStore>(context);
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: ListView(
          children: <Widget>[
            // container do topo da tela
            Container(
              width: 128,
              height: MediaQuery.of(context).size.height * 1.0,
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
                    "TELA DE HOME PAGE",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Text(_appStore.strDisplayName),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
