import 'dart:convert';
import 'dart:io';

import 'package:controle_financeiro_pessoal/services/APIService.dart';

class LoginAPIService implements APIService{

  @override
  String uri = "http://labs.believeit.com.br/projetos/tennis-app-api/api/login"; // TODO: change it to the final version.

  @override
  HttpClient httpClient;

  LoginAPIService(this.httpClient);

  @override
  Future<String> post(Map body) async {
    // Em português: só faz sentido se as APIs pedirem trativas diferentes para cada recurso. Isso ainda não está definido.
    // TODO: set or maintain CLUB body accordingly.
    final request = await this.httpClient.postUrl(Uri.parse(this.uri));
    request.headers.set('content-type', 'applicaton/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    // TODO: check response.statusCode.
    String reply = await response.transform(utf8.decoder).join();
    this.httpClient.close();
    return reply;

  }

}