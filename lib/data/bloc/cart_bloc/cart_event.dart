part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartItems extends CartEvent {}

class ReduceNumberOfProductFromCart extends CartEvent {}

class DeleteFromCart extends CartEvent {
  List<Suggestions>? cartItems;

  DeleteFromCart({
    this.cartItems,
  });
}
