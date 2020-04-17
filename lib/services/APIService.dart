import 'dart:io';

abstract class APIService {

  String uri;
  HttpClient httpClient;
  
  Future<String> post(Map body);
  // TODO: implement get, put and delete.

}