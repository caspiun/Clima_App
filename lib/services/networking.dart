import 'package:http/http.dart';
import 'dart:convert';
class NetworkHelper {
  NetworkHelper(this.URL);

  Uri URL;

  Future getdata() async
  {
    Response response = await get(URL);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeddata = jsonDecode(data);
     var op= decodeddata[''];
    }
    else {
      print(response.statusCode);
    }
  }
}