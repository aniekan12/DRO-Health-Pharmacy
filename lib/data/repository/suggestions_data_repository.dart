import 'package:dro_health_phamarcy/data/models/suggestions.dart';

class SuggestionsDataProvider {
  Future<SuggestionsData> getSuggestionsData() async {
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
    return SuggestionsData(suggestions: suggestions);
  }

  Future<SuggestionsData> getItemsInsideTheCart() async {
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
    return SuggestionsData(suggestions: suggestions);
  }
}
