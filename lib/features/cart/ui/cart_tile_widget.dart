//handle
//handle product tile
import 'package:cart_project/features/home/bloc/home_bloc.dart';
import 'package:cart_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
class CartTileWidget extends StatelessWidget{
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});
  @override
  Widget build(BuildContext context){
    return Container(
      // width: 300,
      // height: 500,
      padding: EdgeInsets.all(4),
      margin:EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            height:320,
            width: double.infinity,
            padding: EdgeInsets.only(top:2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage(productDataModel.imageUrl))
            ),
          ),

          const SizedBox(height: 2,),

          Text(productDataModel.name,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price.toString()}'),
              Row(

                children: [
                  IconButton(
                    onPressed: () {


                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemovedFromCartEvent(productDataModel: productDataModel));
                      // homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct:productDataModel));
                      // homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}