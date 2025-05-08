part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

//loading icon
class HomeLoadingState extends HomeState {}

//display page after loading
class HomeLoadedSuccessState extends HomeState {}

//show error if not loaded
class HomeErrorState extends HomeState {}

//navigate to wishlist page
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

//navigate to cart page
class HomeNavigateToCartPageActionState extends HomeActionState {}
