import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_ecom_app/core/model/product.dart';
import 'package:mt_ecom_app/module/cart/bloc/cart_bloc.dart';

class HomeProductCard extends StatelessWidget {
  final Product product;

  const HomeProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(image: NetworkImage(product.featuredImage))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(product.title),
                  )),
              BlocBuilder<CartBloc, CartState>(
                builder: (cartContext, cartState) {
                  return ProductCardCartButton(
                    product: product,
                    cartContext: cartContext,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductCardCartButton extends StatelessWidget {
  final Product product;
  final BuildContext cartContext;

  const ProductCardCartButton({
    Key? key,
    required this.product,
    required this.cartContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return IconButton(
            onPressed: () {
              if (product.inTheCart == 1) {
                cartContext.read<CartBloc>().add(RemoveFromCartEvent(product));
                product.inTheCart = 0;
              } else {
                cartContext.read<CartBloc>().add(AddToCartEvent(product));
                product.inTheCart = 1;
              }
            },
            icon: (product.inTheCart == 1)
                ? const Icon(
              Icons.shopping_cart_sharp,
              color: Colors.red,
            )
                : const Icon(Icons.shopping_cart_outlined));
  }
}
