import 'package:tennis_play_all/repositories/user.repository.dart';
import 'package:tennis_play_all/view-models/registeruser.view-model.dart';

class UserController{

  UserRepository _userRepository;

  UserController(UserRepository userRepository){
    this._userRepository = userRepository;
  }  

  Future<bool> post(RegisterUserViewModel registerUserViewModel) async {
    return (await _userRepository.post(registerUserViewModel));
  }

}