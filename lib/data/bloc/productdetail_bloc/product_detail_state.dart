part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  @override
  String toString() => 'ProductDetailInitial';
}

class AddProductToCartState extends ProductDetailState {
  @override
  String toString() => 'AddProductToCartState';
}

class AddedProductToCartState extends ProductDetailState {
  @override
  String toString() => 'AddProductToCartState';
}
