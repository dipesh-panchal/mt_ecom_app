import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_ecom_app/module/cart/bloc/cart_bloc.dart';
import 'package:mt_ecom_app/module/cart/widgets/cart_product_cart.dart';
import 'package:mt_ecom_app/module/cart/widgets/grand_total_bottom_bar.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            if (state.pList.isEmpty) {
              return const Center(
                  child: Text('Your cart is empty, please add some products'));
            } else {
              return Column(children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.pList.length,
                      itemExtent: 150,
                      itemBuilder: (BuildContext context, int index) {
                        var currentProduct = state.pList[index];
                        return CardProductCard(product: currentProduct);
                      }),
                ),
                GrandTotalBottomBar(
                  productList: state.pList,
                ),
              ]);
            }
          } else {
            return const Center(
                child: Text('Your cart is empty, please add some products'));
          }
        },
      ),
    );
  }
}
