import 'package:flutter/material.dart';
import 'package:flutter_first_app/personloader.dart';


class PersonDetailsPage extends StatefulWidget {
  PersonDetailsPage({required this.id}) : super();

  final int id;

  @override
  _State createState() => _State(id: id);
}

class _State extends State<PersonDetailsPage> {
  _State({required this.id}) : super();

  int id;
  PersonDetails? person = null ;

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
    final person = this.person;
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
              onTap: () => {} ,
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
