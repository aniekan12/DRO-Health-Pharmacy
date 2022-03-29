import 'package:dro_health_phamarcy/data/models/suggestions.dart';

///initialize singleton to be accessed everywhere
class SaveProducts {
  SaveProducts._saveProductsInstance();
  static final SaveProducts _instance = SaveProducts._saveProductsInstance();

  factory SaveProducts() {
    return _instance;
  }

  final List<Suggestions>? _cartProducts = [];

  int get length => _cartProducts!.length;

  List<Suggestions>? get cartProducts => _cartProducts;

  ///add a product to cart
  void addProductToCart({Suggestions? suggestions}) {
    _cartProducts!.add(suggestions!);
    print(cartProducts.toString());
  }

  ///retrieve a product from cart
  retrieveProductsInCart({Suggestions? suggestions}) {
    print(cartProducts!.first.description);
    return _cartProducts;
  }

  ///remove products from cart
  removeProductsFromCart({List<Suggestions>? product}) {
    _cartProducts!.remove(product);
  }
}
