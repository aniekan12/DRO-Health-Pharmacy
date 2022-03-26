import 'package:bloc/bloc.dart';
import 'package:dro_health_phamarcy/business_logic/save_products.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:equatable/equatable.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final SaveProducts _saveProducts = SaveProducts();

  int get productsLength => _saveProducts.cartProducts!.length;

  ProductDetailBloc(ProductDetailState initialState) : super(initialState);

  @override
  Stream<ProductDetailState> mapEventToState(event) async* {
    if (event is AddProductEvent) {
      yield* _mapAddProductEventToAddProductState(event);
    } else {
      yield ProductDetailInitial();
    }
  }

  Stream<ProductDetailState> _mapAddProductEventToAddProductState(
      event) async* {
    //get the loading state
    yield ProductDetailInitial();
    //get the add product to cart method
    _saveProducts.addProductToCart(suggestions: event.suggestions);

    yield AddedProductToCartState();
  }
}
