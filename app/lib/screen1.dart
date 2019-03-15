import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;


  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);
  void _onChanged3(bool value) => setState(() => _value3 = value);
  void _onChanged4(bool value) => setState(() => _value4 = value);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[


                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xffafafaf),
                        width: 1.0,
                      ),
                    ),
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    borderOnForeground: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/kabir.jpg"),
                                backgroundColor: Colors.white,
                              ),
                              padding: const EdgeInsets.all(1.0),
                              decoration: new BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            title: Text('Kabir'),
                            subtitle: Text("Description"),
                            trailing: new Switch(value: _value1, onChanged: _onChanged1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xffafafaf),
                        width: 1.0,
                      ),
                    ),
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    borderOnForeground: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/sudaksh.jpg"),
                                backgroundColor: Colors.white,
                              ),
                              padding: const EdgeInsets.all(1.0),
                              decoration: new BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            title: Text('Sudaksh'),
                            subtitle: Text("Description"),
                            trailing: new Switch(value: _value2, onChanged: _onChanged2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xffafafaf),
                        width: 1.0,
                      ),
                    ),
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    borderOnForeground: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/samarth.jpg"),
                                backgroundColor: Colors.white,
                              ),
                              padding: const EdgeInsets.all(1.0),
                              decoration: new BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            title: Text('Samarth'),
                            subtitle: Text("Description"),
                            trailing: new Switch(value: _value3, onChanged: _onChanged3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xffafafaf),
                        width: 1.0,
                      ),
                    ),
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    borderOnForeground: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/userimg.jpg"),
                                backgroundColor: Colors.white,
                              ),
                              padding: const EdgeInsets.all(1.0),
                              decoration: new BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            title: Text('Tarushi'),
                            subtitle: Text("Description"),
                            trailing: new Switch(value: _value4, onChanged: _onChanged4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}