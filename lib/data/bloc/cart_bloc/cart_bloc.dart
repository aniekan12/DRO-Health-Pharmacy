import 'package:bloc/bloc.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/data/repository/save_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final SaveProducts _saveProducts = SaveProducts();
  CartBloc() : super(CartInitial());

  @override
  mapEventToState(event) async* {
    if (event is LoadCartItems) {
      yield* _mapLoadCartEventToCartLoadedState(event);
      if (event is DeleteFromCart) {
        yield* _mapDeleteItemFromCartEventToCartItemRemovedState(
            DeleteFromCart());
      }
    }
  }

  Stream<CartState> _mapLoadCartEventToCartLoadedState(
      LoadCartItems event) async* {
    yield CartInitial();
    //get stored values
    List<Suggestions>? _items = _saveProducts.retrieveProductsInCart();

    yield CartLoaded(cartItems: _items);
  }

  Stream<CartState> _mapDeleteItemFromCartEventToCartItemRemovedState(
      DeleteFromCart event) async* {
    yield CartInitial();
    //delete stored values

    _saveProducts.removeProductsFromCart(product: event.cartItems);

    yield ItemDeletingCartState(cartItems: event.cartItems);
  }
}
