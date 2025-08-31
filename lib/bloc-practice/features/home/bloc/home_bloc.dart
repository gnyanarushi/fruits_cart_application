import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_cart/bloc-practice/data/cart_items.dart';
import 'package:fruits_cart/bloc-practice/data/grocery_data.dart';
import 'package:fruits_cart/bloc-practice/data/wishlist_items.dart';
import 'package:fruits_cart/bloc-practice/features/home/model/home_model.dart';

import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickEvent>(
      homeProductWishlistButtonClickEvent,
    );
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    log("iam here");
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.fruits.map(
          (e) => ProductDataModel(
            name: e["name"],
            category: e["category"],
            price: e["price"],
            quantity: e["quantity"],
            imageUrl: e["imageUrl"]
          ),
        ).toList()
      ),
    );

        log("i have converted");

  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
    
    HomeProductWishlistButtonClickEvent event,
    Emitter<HomeState> emit,
  ) {
        print("The product wishlist button is clicked");
        wishListItems.add(event.clickedProduct);
    emit(HomeProductWishlistedActionState());


  }

  FutureOr<void> homeProductCartButtonClickEvent(
    HomeProductCartButtonClickEvent event,
    Emitter<HomeState> emit,
  ) {
    print("The product cart button is clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("wishlist navigate is clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("cart navigate is clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
