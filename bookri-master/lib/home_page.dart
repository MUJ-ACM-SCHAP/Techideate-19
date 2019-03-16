import 'package:flutter/material.dart';
import 'current_location_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'dialog.dart';

class HomePage extends StatelessWidget {
  HomePage(this.name, this.email);

  static final List<String> smh = [
    'assets/mos.jpg',
    'assets/hcverma.jpg',
    'assets/rds.jpg',
    'assets/rs.jpg'
  ];
  static final List<String> items = [
    'Lighter',
    'FileSheets',
    'PowerBank',
    'Maggi'
  ];
  static final List<String> items1 = [
    'Mos book',
    'hc verma',
    'RD Sharma',
    'RS Aggrawal'
  ];



  List<Card> _buildGridCards(BuildContext context) {
    List<Card> card = List.generate(
      smh.length,
          (int index) =>
          Card(
            elevation: 5,
            margin: EdgeInsets.all(6),
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 13.0 / 12.0,
                  child: Image.asset(
                    smh[index],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12.0, 0.0, 8.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        items1[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica',
                            fontSize: 25),
                      ),
                      SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                            showDialog(
                                context: context,
                                child: dialog1(index, context));
                          },  child: Text('FETCH', style: TextStyle(fontSize: 20),)
                          ,color: Theme.of(context).primaryColor,),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
    return card;
  }

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //  backgroundColor: Colors.black,
        title: Text('Bookri'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  name[0],
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Wallet'),
              trailing: Icon(Icons.account_balance_wallet),
              onTap: () {
                Navigator.pushNamed(context, '/wallet');
              },
            ),
            ListTile(
              title: Text('Inventory'),
              trailing: Icon(Icons.class_),
              onTap: () {
                Navigator.pushNamed(context, '/inventory');
              },
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.clear),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          LocationStreamWidget(),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              childAspectRatio: 10.0 / 15.0,
              children: _buildGridCards(context),
            ),
          ),
        ],
      ),
    );
  }
}
