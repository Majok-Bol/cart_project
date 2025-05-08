//handle cart page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget{
  const WishListPage({super.key});
  @override
  WishListPageState createState()=>WishListPageState();

}
class WishListPageState extends State<WishListPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Wish List Page'),centerTitle: true,backgroundColor: Colors.grey.shade200,),
    );
  }
}