import 'package:flutter/material.dart';
import 'package:skillboxdemoapp/persondetails/widget.dart';
import 'package:skillboxdemoapp/personlist/loader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> persons = [];

  void loadPressed() async {
    var loadedPersons = await loadPersons();
    setState(() {
      this.persons = loadedPersons;
    });
  }

  void navigateToDetails(int personId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonDetailsPage(id: personId),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) => Row(
            children: [
              Text(persons[index].id.toString()),
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () => navigateToDetails(persons[index].id),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  persons[index].name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadPressed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
