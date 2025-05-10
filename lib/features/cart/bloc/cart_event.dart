part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class CartInitialEvent extends CartEvent{}
//handle removing cart item
class CartRemovedFromCartEvent extends CartEvent{
  //take product to remove
  final ProductDataModel productDataModel;

  CartRemovedFromCartEvent({required this.productDataModel});

}