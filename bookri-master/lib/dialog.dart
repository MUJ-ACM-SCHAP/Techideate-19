import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'pages/list.dart';




class dialog1 extends StatelessWidget {
  dialog1(this.index,this.cx);
  int index;
  BuildContext cx;


  final DocumentReference user1 =
  Firestore.instance.collection('users').document(user);

  void transction() async {
    final DocumentReference add =
    Firestore.instance.collection('users').document(user);
    await Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(add);
      if (postSnapshot.exists) {
        await tx.update(add, <String, dynamic>{
          'balance': postSnapshot.data['balance'] - 10
        });
      }
    });
  }







  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: new Text(
            'Enter the distance you\'re willing to travel:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          content: new TextField(
            decoration: new InputDecoration(
                labelText: "Distance"
            ),
            onChanged: (String text) {

            },
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            new FlatButton(
              child: new Text("Fetch"),
              onPressed:() {
                Navigator.pop(context);
                Navigator.push(context,  MaterialPageRoute(builder: (context) => list(index)),);

                transction();
              },
            )],
        );

  }
}
