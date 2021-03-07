import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LocationDetails/loader.dart';

void showLocationSheet(BuildContext context, String url) async {
  var details = await loadLocation(url);
  if (details != null)
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Wrap(
              children: [
                Center(
                  child:  Column(
                    children: [
                      Text(details.name),
                      Text(details.created),
                      Text(details.dimension),
                      Text(details.type),
                    ],
                  ),
                ),
              ],
            ),
    );
}
