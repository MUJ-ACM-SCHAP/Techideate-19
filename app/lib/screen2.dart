import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int _radioValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.tag_faces),
              title: Text('How are you Related ?')),
          Container(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Family Member'),
                  Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                ],
              ),
              Container(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  Text('Relatives'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                ],
              ),
              Container(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  Text('Friends'),
                  Radio(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                ],
              ),
              Container(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  Text('Others'),
                  Radio(
                    value: 3,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                ],
              ),
            ],
          ),
          Container(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add,color: Colors.white,),
                    Container(width: 5.0,),
                    Text(
                      'Add Images',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                color: Colors.pink.shade700,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.save,color: Colors.white,),
                    Container(width: 12.0,),
                    Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                color: Colors.pink.shade700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
}