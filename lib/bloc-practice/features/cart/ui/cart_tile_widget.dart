import 'package:flutter/material.dart';
import 'package:fruits_cart/bloc-practice/features/cart/bloc/cart_bloc.dart';
import 'package:fruits_cart/bloc-practice/features/home/model/home_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

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
            child: Image.asset(
              productDataModel.imageUrl,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blueAccent),
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Text(
              productDataModel.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add((clickedProduct: productDataModel));
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        CartRemoveFromCartEvent(
                          productDataModel: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
