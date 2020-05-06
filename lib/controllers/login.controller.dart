import 'package:tennis_play_all/models/user.model.dart';
import 'package:tennis_play_all/repositories/login.repository.dart';
import 'package:tennis_play_all/view-models/login.view-model.dart';

class LoginController {

  LoginRepository _loginRepository;

  LoginController(LoginRepository loginRepository){
    this._loginRepository = loginRepository;
  }

  Future<UserModel> post(LoginViewModel loginViewModel) async {
    return (await _loginRepository.post(loginViewModel));
  }

  bool validateEmail(String text) {
    // TO-DO: case sensitive (text) - adapt it.
    RegExp regex = new RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
    if (regex.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(String text) {
    // TO-DO: try to avoid instantiate twice a regex's object.
    RegExp regex = new RegExp(
        // Mínimo de 8 carac., podendo ser especial, caixa maior, caixa menor ou número.
        r"^[A-Za-z0-9_.@$!%*#?&]{8,}"

        // Mínimo de 8 carac., ao menos 1 núm. e 1 letra.
        // r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"

        // Mínimo de 8 carac., ao menos 1 núm., 1 letra e 1 carac. especial.
        // r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
        );

    //TO-DO: alinhar com backend sobre as senhas.    
    // if (regex.hasMatch(text)) {
    //   return true;
    // } else {
    //   return false;
    // }
    return true;
  }

}
