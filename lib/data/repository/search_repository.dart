import 'package:dro_health_phamarcy/data/models/suggestions.dart';

abstract class SearchDrugsRepository {
  Future<List<Suggestions>> searchDrugs(String query);
}

class SearchDrugsRepositoryImpl extends SearchDrugsRepository {
  @override
  Future<List<Suggestions>> searchDrugs(String query) async {
    List<Suggestions> suggestions = [
      Suggestions(
          pId: 1,
          id: 'PRO23648856',
          drugName: 'Paracetamol',
          imagePath: 'assets/images/drugs/paracetamol.png',
          drugType: 'Tablet',
          drugMeasurement: '500mg',
          description:
              '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
          drugPrice: 'N350.00'),
      Suggestions(
          pId: 2,
          id: 'PRO23648856',
          drugName: 'Doliprane',
          imagePath: 'assets/images/drugs/doliprane.png',
          description:
              '1 pack of Doliprane (1000mg) contains 8 units of 12 tablets.',
          drugType: 'Capsule',
          drugMeasurement: '10000mg',
          drugPrice: 'N350.00'),
      Suggestions(
          pId: 3,
          id: 'PRO23648856',
          drugName: 'Paracetamol',
          imagePath: 'assets/images/drugs/paracetamol_two.png',
          description:
              '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
          drugType: 'Tablet',
          drugMeasurement: '500mg',
          drugPrice: 'N350.00'),
      Suggestions(
          pId: 4,
          id: 'PRO23648856',
          drugName: 'Ibuprofen',
          imagePath: 'assets/images/drugs/ibuprofen.png',
          description:
              '1 pack of Emzor Ibuprofen (200mg) contains 8 units of 12 tablets.',
          drugType: 'Tablet',
          drugMeasurement: '200mg',
          drugPrice: 'N350.00'),
      Suggestions(
          pId: 5,
          drugName: 'Panadol',
          id: 'PRO23648856',
          imagePath: 'assets/images/drugs/panadol.png',
          description:
              '1 pack of Emzor Panadol (500mg) contains 8 units of 12 tablets.',
          drugType: 'Tablet',
          drugMeasurement: '500mg',
          drugPrice: 'N350.00'),
      Suggestions(
          pId: 6,
          id: 'PRO23648856',
          drugName: 'Ibuprofen',
          imagePath: 'assets/images/drugs/ibuprofen_two.png',
          drugType: 'Tablet',
          drugMeasurement: '400mg',
          description:
              '1 pack of Emzor Paracetamol (400mg) contains 8 units of 12 tablets.',
          drugPrice: '₦350.00'),
    ];
    return suggestions;
  }
}
