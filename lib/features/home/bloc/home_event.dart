part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//first event
class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

//second event
class HomeProductCartButtonClickedEvent extends HomeEvent {}

//third event
//go to new page
class HomeWishlistButtonNavigateEvent extends HomeEvent {}

//fourth event
class HomeCartButtonNavigateEvent extends HomeEvent {}
