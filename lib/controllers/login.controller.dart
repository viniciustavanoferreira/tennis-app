import 'package:tennis_play_all/models/user.model.dart';
import 'package:tennis_play_all/repositories/login.repository.dart';
import 'package:tennis_play_all/view-models/login.view-model.dart';

class LoginController {

  LoginRepository loginRepository;

  LoginController({this.loginRepository});

  Future<UserModel> post(LoginViewModel loginViewModel) async {
    return (await loginRepository.post(loginViewModel));

  }

}
