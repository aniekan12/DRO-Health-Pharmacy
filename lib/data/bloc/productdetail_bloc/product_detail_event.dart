part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent(Suggestions? suggestions);

  @override
  List<Object> get props => [];
}

class InitalProductEvent extends ProductDetailEvent {
  const InitalProductEvent(Suggestions? suggestions) : super(suggestions);

  @override
  String toString() => 'InitialProductEvent';
}

class AddProductEvent extends ProductDetailEvent {
  final Suggestions? suggestions;

  const AddProductEvent({this.suggestions}) : super(suggestions);
}

class IncrementProductsEvent extends ProductDetailEvent {
  IncrementProductsEvent(Suggestions? suggestions) : super(suggestions);
}

class DecrementProductsEvent extends ProductDetailEvent {
  DecrementProductsEvent(Suggestions? suggestions) : super(suggestions);
}
