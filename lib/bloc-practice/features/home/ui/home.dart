

// ignore_for_file: unnecessary_cast


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_cart/bloc-practice/features/cart/ui/cart.dart';
import 'package:fruits_cart/bloc-practice/features/home/bloc/home_bloc.dart';
import 'package:fruits_cart/bloc-practice/features/home/ui/product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    print("Iam coming here");
    homeBloc.add(HomeInitialEvent());
    super.initState();
    print("I have loaded initial event");
  }


  @override
  // ignore: override_on_non_overriding_member
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current)  => current is HomeActionsState,
      buildWhen: (previous, current) => current is! HomeActionsState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState ){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
        }
       else if(state is HomeNavigateToWishlistPageActionState ){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
        }
        else if (state is HomeProductWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to wishlist")));
        }
        else if (state is HomeProductCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to cart")));
        }
        
      },
      builder: (context, state) {
          switch (state) {
            case HomeLoadingState():
              return Scaffold(
                body: Center(
                  child:   CircularProgressIndicator(),
                ),
              );
              
            case HomeLoadedSuccessState():
            final successState = state as HomeLoadedSuccessState;
              return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text(
                "Rishi grocery shop",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
                },
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),


          body: ListView.builder(
            itemCount: successState.products.length,
             itemBuilder: (context, index) {
               return ProductTileWidget(productDataModel:successState.products[index], homeBloc: homeBloc, );
             },
          ),
        );
              
            case HomeErrorState():
               return Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
               );
          default : 
          return SizedBox();
          }

       
    
      },
    );
  }
}
