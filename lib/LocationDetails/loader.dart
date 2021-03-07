import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationDetails{
  String name;
  String dimension;
  String type;
  String created;
}

Future<LocationDetails> loadLocation(String url) async{
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var item = convert.jsonDecode(response.body);
    var location = LocationDetails();
    location.name = item["name"];
    location.dimension = item["dimension"];
    location.type = item["type"];
    location.created = item["created"];
    return location;
  }
  return null;
}