import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_project/data/cart_items.dart';
import 'package:cart_project/data/grocery_data.dart';
import 'package:cart_project/data/wishlist_items.dart';
import 'package:cart_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //initiala event
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts.map((e)=>ProductDataModel(
            id: e['id'],
            name:e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl:e['imageUrl']
    )
    ).toList()
    )
    );



  }
  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist Product clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishListActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart Product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist Product navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart Product navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }


}
