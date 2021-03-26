import 'package:flutter/material.dart';
import 'package:skillboxdemoapp/locationdetails.dart';
import 'package:skillboxdemoapp/persondetails/loader.dart';

class PersonDetailsPage extends StatefulWidget {
  PersonDetailsPage({Key key, this.id}) : super(key: key);

  final int id;

  @override
  _State createState() => _State(id: id);
}

class _State extends State<PersonDetailsPage> {
  _State({this.id}) : super();

  int id;
  PersonDetails person;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var personInfo = await loadPerson(id);
    setState(() {
      person = personInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (person == null)
      widget = Center(child: Text("Please, wait..."));
    else
      widget = SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: Image.network(
                person.avatar,
                width: double.infinity,
              ),
              onTap: () => showLocationDetails(
                context,
                person.locationName,
                person.locationUrl,
              ),
            ),
            Text(person.name),
          ],
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text("Person details"),
      ),
      body: widget,
    );
  }
}
