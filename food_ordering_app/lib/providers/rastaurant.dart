import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Helpers/rastaurant.dart';
import 'package:food_ordering_app/Models/rastaurant.dart';

class RastaurantProvider with ChangeNotifier {
  RastaurantService rastaurantService = RastaurantService();
  List<RastaurantModel> rastaurants = [];
  RastaurantModel rastaurant;
  List<RastaurantModel> searchedrastaurant = [];

  RastaurantProvider.initialize() {
    _loadrastaurants();
  }

  _loadrastaurants() async {
    rastaurants = await rastaurantService.getrastaurants();
    notifyListeners();
  }

  loadSingleRastaurant({String rasid}) async {
    rastaurant = await rastaurantService.getRestaurantById(id: rasid);
    notifyListeners();
  }

  Future search({String rasname}) async {
    searchedrastaurant =
        await rastaurantService.searchrastaurant(rastaurantname: rasname);
    notifyListeners();
  }
}
