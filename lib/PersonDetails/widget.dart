import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LocationDetails/widget.dart';

import 'loader.dart';

class PersonDetailsWidget extends StatefulWidget {
  final int personId;

  PersonDetailsWidget({Key key, this.personId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PersonDetailsState(this);
}

class PersonDetailsState extends State<PersonDetailsWidget> {
  final PersonDetailsWidget widget;
  PersonDetails _details;

  PersonDetailsState(this.widget);

  @override
  void initState() {
    super.initState();
    loadAndSetState();
  }

  void loadAndSetState() async {
    var details = await loadPerson(widget.personId);
    setState(() {
      _details = details;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (_details == null)
      widget = Center(child: Text("Please, wait..."));
    else
      widget = SafeArea(
        child: Column(
          children: [
            Image.network(
              _details.avatar,
              width: double.infinity,
            ),
            Text(_details.name),
            MaterialButton(
              onPressed: () => showLocationSheet(context, _details.locationUrl),
              child: Text(_details.locationName),
            )
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
