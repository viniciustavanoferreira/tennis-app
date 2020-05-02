import 'dart:convert';

import 'package:tennis_play_all/models/user.model.dart';
import 'package:tennis_play_all/utils/constants.dart';
import 'package:tennis_play_all/view-models/login.view-model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  Future<UserModel> post(LoginViewModel loginViewModel) async =>
      (UserModel.fromJson( _getResponseBody(await http.post(API_URL + '/auth/login',
          headers: _createHeader(), body: loginViewModel.toJson()))));

  Map<String, String> _createHeader() => ({"Content-type": "application/json"});

  Map<String, dynamic> _getResponseBody(http.Response response) {
    if (response.statusCode == 200) {
      return (json.decode(response.body.toString()));
    } else {
      throw Exception('Error - API');
    }
  }

}
