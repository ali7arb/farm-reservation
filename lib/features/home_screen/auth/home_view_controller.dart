import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewController extends GetxController {
  List<FarmModel> get farmModel => _farmModel;
  final RxList<FarmModel> _farmModel = <FarmModel>[].obs;

  SharedPreferences? _prefs;

  final CollectionReference farmCollectionReference =
      FirebaseFirestore.instance.collection('Farms');

  HomeViewController() {
    _farmModel.addAll([]);
    getFarm();
  }

  Future<void> getFarm() async {
    try {
      QuerySnapshot farmSnapshot = await farmCollectionReference.get();
      _farmModel.clear();
      for (QueryDocumentSnapshot doc in farmSnapshot.docs) {
        _farmModel.add(FarmModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching farms: $e');
    }
    await _loadPreferences();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs != null) {
      List<String>? favorites = _prefs?.getStringList('isFavorite');
      if (favorites != null) {
        for (var farm in _farmModel) {
          if (farm.id != null && favorites.contains(farm.id!)) {
            farm.isFavorite!.value = true;
          } else {
            farm.isFavorite!.value = false;
          }
        }
      }
    }
    update();
  }

  void _savePreferences() {
    List<String> favorites = _farmModel
        .where((farm) => farm.isFavorite!.value)
        .map((farm) => farm.id)
        .where((id) => id != null)
        .cast<String>()
        .toList();
    _prefs?.setStringList('isFavorite', favorites);
  }

  void toggleFavorite(int index) {
    _farmModel[index].isFavorite!.value = !_farmModel[index].isFavorite!.value;
    _savePreferences();
    update();
  }
}
