import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLocationDetails(BuildContext context, String name, String url) {
  showModalBottomSheet(
    context: context,

    builder: (context) => Wrap(
      children: [
        Center(
          child: Column(
            children: [
              Text(name, style: TextStyle(fontSize: 20)),
              Text(url, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    ),
  );
}
