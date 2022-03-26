import 'package:dro_health_phamarcy/data/models/suggestions.dart';

///initialize singleton to be accessed everywhere
class SaveProducts {
  SaveProducts._saveProductsInstance();
  static final SaveProducts _instance = SaveProducts._saveProductsInstance();

  factory SaveProducts() {
    return _instance;
  }

  List<Suggestions>? _cartProducts = [];

  int get length => _cartProducts!.length;

  List<Suggestions>? get cartProducts => _cartProducts;

  void addProductToCart({Suggestions? suggestions}) {
    cartProducts!.add(suggestions!);
    print(cartProducts.toString());
  }
}
