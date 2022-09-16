

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_ecom_app/module/cart/bloc/cart_bloc.dart';
import 'package:mt_ecom_app/module/cart/page/cart_screen.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Cart()));
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartUpdated) {
              return state.pList.isNotEmpty
                  ? Positioned(
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,
                          size: 20.0, color: Colors.red[500]),
                      Positioned(
                          top: 3.0,
                          right: 0.0,
                          left: .0,
                          child: Center(
                            child: Text(
                              state.pList.length.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  ))
                  : const SizedBox.shrink();
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
