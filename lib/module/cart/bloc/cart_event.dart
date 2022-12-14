part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  final Product product;

  const AddToCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;

  const RemoveFromCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}
class GetProductsFromLocalDbEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
