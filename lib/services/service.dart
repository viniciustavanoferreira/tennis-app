import 'dart:convert';

import 'package:http/http.dart' as http;

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
    return (getResponseBody(await http.get(_url + urn)));
  }

  // TO-DO: necessário escrever testes unitários após correção das APIs no CodeIgniter/ MySQL!.
  Future<String> delete(String urn) async {
    // TO-DO: implementar :-D
  }

  // TO-DO: necessário escrever testes unitários após correção das APIs no CodeIgniter/ MySQL!.
  Future<String> put(String body, String urn) async {
    return(getResponseBody(await http.put(_url + urn, headers: _createHeader(), body: body)));
  }

  Future<String> post(String body, String urn) async {
    return(getResponseBody(await http.post(_url + urn, headers: _createHeader(), body: body)));
  }

  Map<String, String> _createHeader() {
    return ({
      "Content-type": "application/json"
    });
  }

  String getResponseBody(http.Response response){    
    if (response.statusCode == 200) {
      return (response.body);
    } else {
      throw Exception('Error - API');
    }
  }

}