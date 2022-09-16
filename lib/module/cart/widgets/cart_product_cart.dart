import 'package:flutter/material.dart';
import 'package:mt_ecom_app/core/model/product.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  const CardProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image(
                    image: NetworkImage(
                        product.featuredImage))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price '),
                        Text(
                            '\$ ${product.price.toString()}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Quantity '),
                        Text('1')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
