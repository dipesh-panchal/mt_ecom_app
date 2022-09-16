import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_ecom_app/core/model/product.dart';
import 'package:mt_ecom_app/module/home/bloc/fetch_data_bloc.dart';
import 'package:mt_ecom_app/service/local/local_db.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetProductsFromLocalDbEvent>((event, emit) async {
      var productList = await DatabaseHelper.internal().queryAllRows();
      List<Product> pList = [];
      if(productList.isNotEmpty){
      for (var product in productList) {
        Product temp = Product.fromJson(product);
        pList.add(temp);
      }
      emit(CartUpdated(pList: pList));}
    });
    on<AddToCartEvent>((event, emit) async {
      if (state is CartUpdated) {
        var cartState = state as CartUpdated;
        cartState.pList.add(event.product);
        emit(CartInitial());
        await DatabaseHelper.internal().insert(event.product.toJson());
        emit(CartUpdated(pList: cartState.pList));
      } else {
        await DatabaseHelper.internal().insert(event.product.toJson());
        emit(CartUpdated(pList: [event.product]));
      }
    });
    on<RemoveFromCartEvent>((event, emit) async {
      if (state is CartUpdated) {
        var cartState = state as CartUpdated;
        cartState.pList
            .removeWhere((element) => element.title == event.product.title);
        emit(CartInitial());
        await DatabaseHelper.internal().delete(event.product.id);
        emit(CartUpdated(pList: cartState.pList));
      } else {
        emit(const CartUpdated(pList: []));
      }
    });
  }
}
