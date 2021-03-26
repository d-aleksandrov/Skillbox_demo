import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Person{
  int id;
  String name;
  String status;
}

Future<List<Person>> loadPersons() async{
  var response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
  List<Person> persons = [];

  if(response.statusCode == 200){
    var jsonResponse = convert.jsonDecode(response.body);
    List<dynamic> resultsList = jsonResponse["results"];

    for(var result in resultsList){
      Person person = Person();
      person.id = result["id"];
      person.name = result["name"];
      person.status = result["status"];

      persons.add(person);
    }
  } else {

  }

  return persons;
}