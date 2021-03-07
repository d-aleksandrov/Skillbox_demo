import 'package:flutter/material.dart';

import 'file:///C:/Users/guita/Documents/Repositories/flutter_app/lib/PersonDetails/widget.dart';

import 'loader.dart';

class PersonListWidget extends StatefulWidget {
  PersonListWidget({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PersonListWidget> {
  List<Person> _persons = [];

  void _incrementCounter() async {
    var persons = await loadPersons();
    setState(() {
      _persons = persons;
    });
  }

  void onPersonClick(BuildContext context, Person person) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PersonDetailsWidget(personId: person.id)),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) => Row(
              children: [
                Image.network(
                  _persons[index].avatar,
                  width: 100,
                ),
                IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Colors.deepOrange,
                    size: 50.0,
                  ),
                  onPressed: () => onPersonClick(context, _persons[index]),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "${_persons[index].id.toString()}    ${_persons[index].name}",
                  ),
                ),
              ],
            ),
            itemCount: _persons.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods;
      );
}
