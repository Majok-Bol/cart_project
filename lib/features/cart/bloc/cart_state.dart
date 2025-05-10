part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState{}
final class CartInitial extends CartState {}
//handle success state
class CartSuccessState extends CartState{
  //display only cart products
  final List<ProductDataModel>cartItems;
  CartSuccessState({required this.cartItems});
}