class SuggestionsData {
  List<Suggestions?> suggestions;

  SuggestionsData({required this.suggestions});

  void addToCart(Suggestions cartItem) {
    suggestions.add(cartItem);
    print(suggestions);
  }

  void removeFromCart(Suggestions cartItem) {
    suggestions.remove(cartItem);
  }
}

class Suggestions {
  final String? id;
  final String? imagePath;
  final String? drugName;
  final String? drugType;
  final String? description;
  final String? drugMeasurement;
  final String drugPrice;

  Suggestions({
    required this.drugName,
    required this.description,
    required this.id,
    required this.imagePath,
    required this.drugType,
    required this.drugMeasurement,
    required this.drugPrice,
  });
}

List<Suggestions> suggestions = [
  Suggestions(
      id: 'PRO23648856',
      drugName: 'Paracetamol',
      imagePath: 'assets/images/drugs/paracetamol_two.png',
      drugType: 'Tablet',
      description:
          '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
      drugMeasurement: '500mg',
      drugPrice: 'N350.00'),
  Suggestions(
      id: 'PRO23648856',
      drugName: 'Doliprane',
      imagePath: 'assets/images/drugs/doliprane.png',
      drugType: 'Capsule',
      description:
          '1 pack of Doliprane (1000mg) contains 8 units of 12 tablets.',
      drugMeasurement: '10000mg',
      drugPrice: 'N350.00'),
  Suggestions(
      id: 'PRO23648856',
      drugName: 'Paracetamol',
      imagePath: 'assets/images/drugs/paracetamol_two.png',
      drugType: 'Tablet',
      description:
          '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
      drugMeasurement: '500mg',
      drugPrice: 'N350.00'),
  Suggestions(
      id: 'PRO23648856',
      drugName: 'Ibuprofen',
      imagePath: 'assets/images/drugs/ibuprofen.png',
      drugType: 'Tablet',
      description:
          '1 pack of Emzor Ibuprofen (200mg) contains 8 units of 12 tablets.',
      drugMeasurement: '200mg',
      drugPrice: 'N350.00'),
  Suggestions(
      drugName: 'Panadol',
      id: 'PRO23648856',
      description:
          '1 pack of Emzor Panadol (500mg) contains 8 units of 12 tablets.',
      imagePath: 'assets/images/drugs/panadol.png',
      drugType: 'Tablet',
      drugMeasurement: '500mg',
      drugPrice: 'N350.00'),
  Suggestions(
      id: 'PRO23648856',
      drugName: 'Ibuprofen',
      imagePath: 'assets/images/drugs/ibuprofen_two.png',
      drugType: 'Tablet',
      description:
          '1 pack of Emzor Paracetamol (400mg) contains 8 units of 12 tablets.',
      drugMeasurement: '400mg',
      drugPrice: '₦350.00')
];
