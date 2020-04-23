/*import 'package:http/http.dart' as http;

class Service {

  final String _url = "http://labs.believeit.com.br/projetos/tennis-app-api/api";
  Map<String, String> headers;
  static Service _instance;

  Service._();

  static Service get instance {
    return _instance ??= Service._();
  }

  // TO-DO: necessário escrever testes unitários após correção das APIs no CodeIgniter/ MySQL!.
  Future<String> get(String urn) async {
    http.Response response = await http.get(_url + urn);
    return (response.body);
  }

  // TO-DO: necessário escrever testes unitários após correção das APIs no CodeIgniter/ MySQL!.
  Future<String> delete(String urn) async {
    http.Response response = await http.get(_url + urn);
    return (response.body);
  }

  // TO-DO: necessário escrever testes unitários após correção das APIs no CodeIgniter/ MySQL!.
  Future<String> put(String body, String urn) async {
    http.Response response = await http.post(_url + urn, headers: _createHeader(), body: body);
    return (response.body);
  }
  
  Future<String> post(String body, String urn) async {
    http.Response response = await http.post(_url + urn, headers: _createHeader(), body: body);
    return (response.body);
  }

  Map<String, String> _createHeader(){
    return({"Content-type": "application/json"});
  }

}
*/