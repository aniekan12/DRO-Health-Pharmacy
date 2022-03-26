part of 'product_counter_bloc.dart';

abstract class ProductCounterEvent extends Equatable {
  const ProductCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementProductEvent extends ProductCounterEvent {}

class DecrementProductEvent extends ProductCounterEvent {}
