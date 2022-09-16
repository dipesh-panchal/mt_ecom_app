import 'package:flutter/material.dart';
import 'package:mt_ecom_app/core/model/product.dart';

class GrandTotalBottomBar extends StatelessWidget {
  final List<Product> productList;

  const GrandTotalBottomBar({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var grandTotal = 0;
    for (var element in productList) {
      grandTotal += element.price;
    }
    return Container(
      color: Colors.blue.shade300,
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total items : ${productList.length}'),
            Text('Grand total : \$ $grandTotal'),
          ],
        ),
      ),
    );
  }
}
