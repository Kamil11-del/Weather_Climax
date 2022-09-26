import 'package:http/http.dart';
import 'dart:convert';
class NetworkHelper{
  NetworkHelper( this.Url);
  final String Url;
  Future getData()async{
Response response = await get(Uri.parse(
        Url),);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

}