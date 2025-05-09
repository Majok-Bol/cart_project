import 'package:cart_project/features/home/bloc/home_bloc.dart';
import 'package:cart_project/features/home/ui/product_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_project/features/cart/ui/cart_page.dart';
import 'package:cart_project/features/wishlist/ui/wish_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  //create instance of HomeBloc
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      //listen if current home action state
      listenWhen: (previous, current)=>current is HomeActionState,
      //build if current home action state
      buildWhen: (previous, current)=>current is  !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>CartPage()));
        }else if(state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>WishListPage()));

        }else if(state is HomeProductItemCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Cart added successfully')));
        } else if(state is HomeProductItemWishListActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to wishlist')));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(body:Center(child: CircularProgressIndicator(),),);
          case HomeLoadedSuccessState:
            final successState=state as HomeLoadedSuccessState;
             return Scaffold(
              appBar: AppBar(
                title: Text('Bashbytes Grocery App'),
                centerTitle: true,
                backgroundColor: Colors.blue.shade200,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
               body:ListView.builder(
                 itemCount:successState.products.length,
                   itemBuilder:(context,index){
                   return ProductTileWidget(
                     homeBloc: homeBloc,
                       productDataModel: successState.products[index]);

               }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error occurred'),),);

          default:
            return SizedBox();
        }
      },
    );
  }
}
