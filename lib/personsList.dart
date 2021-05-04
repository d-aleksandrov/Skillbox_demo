import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skillboxdemo052021/persondetails/widget.dart';

import 'personsLoader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> persons = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    var persons = await loadPersons();
    setState(() {
      this.persons = persons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SafeArea(
          child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) => showPerson(persons[index])),
        ),
      ),
    );
  }

  void navigateToPersonDetails(int person) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PersonDetailsPage(id: person)));
  }

  Widget showPerson(Person person) => Container(
        child: GestureDetector(
          onTap: () => {navigateToPersonDetails(person.id)},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Image.network(
                  person.image,
                  width: 50,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.name,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        person.status,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
