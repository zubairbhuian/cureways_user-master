import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/endpoints.dart';
import '../exceptions/network_exceptions.dart';

class ApiClient{

  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> getData(String url) async {
    var request = http.Request('GET', Uri.parse(url));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      dynamic jsonList = jsonDecode(jsonDataString);
      return jsonList;
    } else {
      return false;
    }
  }
Future<dynamic>postData(String url)async{
  var request = http.Request('POST', Uri.parse(url));


  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());
    String jsonDataString = await response.stream.bytesToString();
    dynamic jsonList = jsonDecode(jsonDataString);
    return jsonList;

  }
  else {
  //  print(response.reasonPhrase);
    return false;
  }

}



}