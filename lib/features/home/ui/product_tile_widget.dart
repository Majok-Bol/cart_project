//handle product tile
import 'package:cart_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';

class ProductTileWidget extends StatelessWidget{
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(12),
      margin:EdgeInsets.all(12),
      child: Column(
        children: [
          ClipRect(
            child: Image.network(
              width: 400,
                height: 400,
                productDataModel.imageUrl),

          ),

          Text(productDataModel.name),
          Text(productDataModel.description),

        ],
      ),
    );
  }
}