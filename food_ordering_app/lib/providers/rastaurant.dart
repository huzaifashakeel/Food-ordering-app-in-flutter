import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Helpers/rastaurant.dart';
import 'package:food_ordering_app/Models/rastaurant.dart';

class RastaurantProvider with ChangeNotifier {
  RastaurantService rastaurantService = RastaurantService();
  List<RastaurantModel> rastaurants = [];

  RastaurantProvider.initialize() {
    _loadrastaurants();
  }

  _loadrastaurants() async {
    rastaurants = await rastaurantService.getrastaurants();
    notifyListeners();
  }
}
