import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> items = ['Lighter', 'FileSheets', 'PowerBank', 'Maggi'];

class list extends StatefulWidget {
  list(this.index);

  int index;

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.black,
        title: Text('Bookri'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection("users")
                    .where(items[widget.index], isEqualTo: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text("There is no expense");
                  return new ListView(children: getExpenseItems(snapshot));
                }),
          )
        ],
      ),
    );
  }
}

getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) =>
    new ListTile(
      title: new Text(doc["name"]),
      subtitle: new Text("Contact Number: " + doc["number"].toString()),
      trailing: IconButton(
          icon: Icon(Icons.map),
          onPressed: () {
            launch("https://www.google.com/maps/search/?api=1&query=" +
                doc["Latitude"].toString() + "," + doc["Longitude"].toString());
          }),
    ))
        .toList();
  }

