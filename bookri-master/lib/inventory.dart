import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pringle_proj/main.dart';

final DocumentReference inventory= Firestore.instance.collection('users').document(user);

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  List<bool> values=[false,false,false,false];
  List<String> items = ['Lighter', 'FileSheets', 'PowerBank', 'Maggi'];
  List<String> items1 = [ 'Mos book','hc verma','rd sharma','rs aggrawal'];

  @override
  void initState() {
    chck();
    super.initState();
  }

  @override

  void chck(){
    inventory.get().then((datasnapshot) {
      setState((){
        values[0]= datasnapshot.data[items[0]];
        values[1]= datasnapshot.data[items[1]];
        values[2]= datasnapshot.data[items[2]];
        values[3]= datasnapshot.data[items[3]];
      });
    });
  }

  void changevalue(int i,bool b) {
    inventory.get().then((datasnapshot) {
      Map<String, bool> data = <String, bool>{
        items[i]: b
      };
      inventory.updateData(data);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory'),),
      body: Center(
        child: ListView.builder(itemBuilder:(context,int index){
          return CheckboxListTile(value: values[index], onChanged: (bool value){setState(() {
            values[index]=value;
            changevalue(index,value);
          });},
            title: Text(items1[index]),
          );
        } ,itemCount: 4,),
      ),
    );
  }
}
