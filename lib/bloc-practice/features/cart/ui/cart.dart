import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_cart/bloc-practice/data/cart_items.dart';
import 'package:fruits_cart/bloc-practice/features/cart/bloc/cart_bloc.dart';
import 'package:fruits_cart/bloc-practice/features/cart/ui/cart_tile_widget.dart';
 

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
     print("success state");
     log("this is me");
      cartBloc.add(CartInitialEvent());
    super.initState();
     log("this is me");
     print(cartItems.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Items"),backgroundColor: Colors.cyan,),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},

        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
          
        builder: (context, state) {
          switch (state.runtimeType) {
             
            case CartSuccessState:
             
               final successState = state as CartSuccessState;
              
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    productDataModel: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );
            
          }

             return Container();
        },
      ),
    );
  }
}
