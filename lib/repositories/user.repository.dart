import 'package:tennis_play_all/utils/constants.dart';
import 'package:tennis_play_all/view-models/registeruser.view-model.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  Future<bool> post(RegisterUserViewModel registerUserViewModel) async =>
      (_getResponseBody(await http.post(API_URL + '/user',
          headers: _createHeader(), body: registerUserViewModel.toJson())));

  Map<String, String> _createHeader() => ({"Content-type": "application/json"});

  bool _getResponseBody(http.Response response) {
    if (response.statusCode == 200) {
      return (true);
    } else {
      throw Exception('Error - API');
    }
  }
}