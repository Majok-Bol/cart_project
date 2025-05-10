//handle cart page
import 'package:cart_project/features/cart/bloc/cart_bloc.dart';
import 'package:cart_project/features/cart/ui/cart_tile_widget.dart';
import 'package:cart_project/features/home/bloc/home_bloc.dart';
import 'package:cart_project/features/home/ui/product_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});
  @override
  CartPageState createState()=>CartPageState();

}
class CartPageState extends State<CartPage>{
  final CartBloc cartBloc=CartBloc();
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Cart Items'),centerTitle: true,backgroundColor: Colors.grey.shade400,
      ),
    body: BlocConsumer<CartBloc,CartState>(
      bloc: cartBloc,
        builder: (context,state){
        switch(state.runtimeType){
          case CartSuccessState:
            final successState=state as CartSuccessState;
            return ListView.builder(
              itemCount: successState.cartItems.length,

                itemBuilder:(context,index){
                  return CartTileWidget(
                      productDataModel:successState.cartItems[index], cartBloc: cartBloc);



            });
          default:

        }
        return Container();
        },
        listenWhen:(previous, current) => current is CartActionState ,
        buildWhen:(previous, current) => current is !CartActionState ,
        listener:(context,state){

        }),);
  }
}