part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
class HomeInitial extends HomeState {}
abstract class HomeActionsState extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  }
  );
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionsState {}

class HomeNavigateToCartPageActionState extends HomeActionsState {}

class HomeProductWishlistedActionState extends HomeActionsState{}
class HomeProductCartedActionState extends HomeActionsState{}