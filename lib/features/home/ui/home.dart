import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=>HomePageState();

}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Bashbytes Grocery App'),centerTitle: true,backgroundColor: Colors.blue.shade200,elevation: 0,),
    );
  }
}