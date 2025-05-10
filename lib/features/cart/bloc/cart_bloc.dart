import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_project/data/cart_items.dart';
import 'package:cart_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
 on<CartInitialEvent>(cartInitialEvent);
 on<CartRemovedFromCartEvent>(cartRemovedFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems:cartItems));
  }

  FutureOr<void> cartRemovedFromCartEvent(CartRemovedFromCartEvent event, Emitter<CartState> emit) {
    //get cart items
    //check if product is there
    //if yes
    //remove it
    //run a function
    cartItems.remove(event.productDataModel);
    //emit a state
    emit(CartSuccessState(cartItems: cartItems));

  }
}
