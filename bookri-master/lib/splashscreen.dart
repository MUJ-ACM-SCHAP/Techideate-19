import 'package:flutter/material.dart';
import 'main.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState(){

    super.initState();
    Future.delayed(Duration(
        seconds: 5
    ),
            (){  Navigator.push(context, MaterialPageRoute(builder: (context)=> Pranjal()));

        }

    );

  }










  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      body:
      Center(
        child:
        Column( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Image.asset('assets/bookri.jpg' )


          ],



        ),
      ),
    );

  }
}