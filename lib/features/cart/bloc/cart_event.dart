part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class CartInitialEvent extends CartEvent{}
//handle removing cart item
class CartRemovedFromCartEvent extends CartEvent{}