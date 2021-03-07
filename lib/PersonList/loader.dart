import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Person {
  int id;
  String name;
  String avatar;
}

Future<List<Person>> loadPersons() async {
  var response = await http.get("https://rickandmortyapi.com/api/character");
  List<Person> persons = [];
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    List<dynamic> items = jsonResponse["results"];
    for (var item in items) {
      Person person = Person();
      person.id = item["id"];
      person.name = item["name"];
      person.avatar = item["image"];
      persons.add(person);
    }
  }
  return persons;
}