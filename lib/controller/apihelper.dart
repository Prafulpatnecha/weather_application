
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  Future<Map> apiCalling(String location)
  async {
    String apiJson ="https://api.weatherapi.com/v1/forecast.json?key=a7caeb86ed394400896162819243107&q=$location";
    Uri uri=Uri.parse(apiJson);
    Response response= await http.get(uri);
    if(response.statusCode==200)
      {
        final body=response.body;
        final json=jsonDecode(body);
        return json;
      }
    else{
      print('Never Api Connected');
      return {};
    }
  }
}