part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  List<Suggestions>? cartItems = [];

  CartLoaded({this.cartItems}) : super();
}

class ItemDeletingCartState extends CartState {
  List<Suggestions>? cartItems;

  ItemDeletingCartState({this.cartItems});
}
