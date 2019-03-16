import 'package:flutter/material.dart';
import 'home_page.dart';
import 'inventory.dart';
import 'wallet.dart';
import 'splashscreen.dart';
import 'package:geolocator/geolocator.dart' show Geolocator, LocationAccuracy, LocationOptions;

var geolocator = Geolocator();
var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);


var user= "naman";


void main() => runApp(Pringle());

class Pringle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookri',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        primaryColorDark: Colors.orange,
        accentColor: Colors.orangeAccent,
        iconTheme: IconThemeData(color: Colors.orange),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.orange,
            splashColor: Colors.orangeAccent,
            ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.orange, fontSize: 10.0),
          hintStyle: TextStyle(
              color: Colors.orange,
              fontSize: 10.0,
              decorationColor: Colors.orange),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)),
        ),
      ),
      routes: {
        '/a': (context) => HomePage('Pranjal', 'pranjalbhardwaj40@gmail.com'),
        '/inventory': (context) => Inventory(),
        '/wallet': (context) => Wallet(),

      },
      home: MyApp(),
    );
  }
}

class Pranjal extends StatefulWidget {
  @override
  _PranjalState createState() => _PranjalState();
}

class _PranjalState extends State<Pranjal> with SingleTickerProviderStateMixin {
  final _pass = TextEditingController();
  final _user = TextEditingController();
  String name = 'Pringle';
  Animation<double> animation;
  AnimationController _controller;
  String _usert, _passt;
  bool _boole = true;
  Color c = Colors.orange;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 80, end: 160).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _user.dispose();
    _pass.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/kanika.gif"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/bookri.jpg'),
                height: animation.value,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(color: Colors.orange),
                      controller: _user,
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            style: TextStyle(color: Colors.orange),
                            controller: _pass,
                            obscureText: _boole,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(hintText: 'Enter password'),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: c,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_boole == true) {
                                  _boole = false;
                                  c = Colors.grey;
                                } else {
                                  _boole = true;
                                  c = Theme.of(context).primaryColor;
                                }
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/a');
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 10),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: RaisedButton(
                  onPressed: () {
                    //Naviagte to signup page
                  },
                  child: Text('SignUp'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
