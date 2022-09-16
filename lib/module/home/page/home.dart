import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_ecom_app/module/cart/bloc/cart_bloc.dart';
import 'package:mt_ecom_app/module/home/bloc/fetch_data_bloc.dart';
import 'package:mt_ecom_app/module/home/widgets/app_bar_cart.dart';
import 'package:mt_ecom_app/module/home/widgets/home_product_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Mall'),
        centerTitle: true,
        actions: const [AppBarCart()],
      ),
      body: BlocBuilder<FetchDataBloc, FetchDataState>(
        builder: (context, state) {
          if (state is FetchingData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchDataSuccess) {
            BlocProvider.of<CartBloc>(context)
                .add(GetProductsFromLocalDbEvent());
            return GridView.builder(
              itemCount: state.productList.length,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                var currentProduct = state.productList[index];
                return BlocBuilder<CartBloc, CartState>(
                  builder: (cartContext, cartState) {
                    if (cartState is CartUpdated) {
                      for (var product in cartState.pList) {
                        if (product.id == currentProduct.id) {
                          currentProduct.inTheCart = product.inTheCart;
                        }
                      }
                    }
                    return HomeProductCard(product: currentProduct);
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text("oops something went wrong"),
            );
          }
        },
      ),
    );
  }
}
