part of 'product_counter_bloc.dart';

abstract class ProductCounterState extends Equatable {
  final int? counter;
  const ProductCounterState({required this.counter});

  @override
  List<Object> get props => [counter!];
}

class ProductCounterInitial extends ProductCounterState {
  ProductCounterInitial(int? counter) : super(counter: counter);
}

class ProductAdded extends ProductCounterState {
  ProductAdded({int? counter}) : super(counter: counter);
}

class ProductRemoved extends ProductCounterState {
  ProductRemoved({int? counter}) : super(counter: counter);
}
