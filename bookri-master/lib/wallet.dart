import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pringle_proj/main.dart';

final DocumentReference amount= Firestore.instance.collection('users').document(user);

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin{

  var bal;
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    balance();
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2),vsync: this);
    animation= CurvedAnimation(parent: _controller, curve: Curves.bounceIn)..addListener((){setState(() {

    });});
    //change
  }

  @override
  void balance(){
    amount.get().then((datasnapshot) {
      setState((){
        bal= datasnapshot.data['balance'];
      });
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget fun(){
    if(bal==null)
      return CircularProgressIndicator();
    else {
      _controller.forward();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.account_balance_wallet, color: Theme
              .of(context)
              .primaryColor, size: 100 * animation.value,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Balance: ' + bal.toString()),
          ),
        ],
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet'),),
      body: Center(
        child: fun(),
      ),
    );
  }
}
