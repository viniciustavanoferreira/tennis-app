import 'package:controle_financeiro_pessoal/services/APIService.dart';

class Service {
  
  APIService apiService;

  Service(this.apiService);

  Future<String> post(Map body){
    return this.apiService.post(body);
  }

}