//handle cart page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});
  @override
  CartPageState createState()=>CartPageState();

}
class CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Wish List Page'),centerTitle: true,backgroundColor: Colors.grey.shade400,
      ),);
  }
}