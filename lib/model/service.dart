import 'package:http/http.dart' as http;

class Service {

  final String _url = "http://labs.believeit.com.br/projetos/tennis-app-api/api";
  Map<String, String> headers;

  // TO-DO: implementar singleton e viabilizar o aproveitamento da mesma instância.

  Future<String> post(String body, String urn) async {
    http.Response response = await http.post(_url + urn, headers: _createHeader(), body: body);
    return (response.body);
  }

  Map<String, String> _createHeader(){
    return({"Content-type": "application/json"});
  }

}