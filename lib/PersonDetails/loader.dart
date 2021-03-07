import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PersonDetails {
  String name;
  int id;
  String avatar;
  String locationName;
  String locationUrl;
  String status;
  String created;
  String type;
  String gender;

  String originName;
  String originUrl;
  List<String> episodes;
}

Future<PersonDetails> loadPerson(int id) async {
  var response =
  await http.get("https://rickandmortyapi.com/api/character/$id");
  PersonDetails person;
  if (response.statusCode == 200) {
    var item = convert.jsonDecode(response.body);
    person = PersonDetails();
    person.id = item["id"];
    person.name = item["name"];
    person.avatar = item["image"];
    person.locationName = item["location"]["name"];
    person.locationUrl = item["location"]["url"];
    person.status = item["status"];
    person.created = item["created"];
    person.gender = item["gender"];
    person.type = item["type"];
    person.originName = item["origin"]["name"];
    person.originUrl = item["origin"]["url"];
    person.episodes = item["episode"];
  }
  return person;
}
