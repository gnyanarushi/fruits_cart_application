
import 'package:flutter/material.dart';
import 'package:fruits_cart/bloc-practice/features/home/bloc/home_bloc.dart';
import 'package:fruits_cart/bloc-practice/features/home/model/home_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(productDataModel.imageUrl),
              ),
              border: Border.all(width: 1, color: Colors.blueAccent),
            ),
          ),
         Container(
          height: 30,
          margin: EdgeInsets.all(10),
          child: Text(productDataModel.name,style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
           
         ),


         Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$${productDataModel.price}" , 
          style:TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Colors.red
            
          )
           ,),


           Row(
            children: [
               IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductWishlistButtonClickEvent(clickedProduct: productDataModel));
                },
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonClickEvent(clickedProduct: productDataModel));
                },
                icon: Icon(Icons.shopping_bag),
              ),
            ],
           )
        ],
         )



        ],
      ),
    );
  }
}
