//handle product tile
import 'package:cart_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
class ProductTileWidget extends StatelessWidget{
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});
  @override
  Widget build(BuildContext context){
    return Container(
      width: 300,
      height: 400,
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
          Text('\$${productDataModel.price.toString()}'),

        ],
      ),
    );
  }
}