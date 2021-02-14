import 'package:flutter/material.dart';

enum SearchBy { PRODUCTS, RASTAURANTS }

class AppProvider with ChangeNotifier {
  bool isloading = false;
  SearchBy search = SearchBy.PRODUCTS;
  String filterBy = "Products";

  void changeloading() {
    isloading = !isloading;
    notifyListeners();
  }

  void changeSearchby({SearchBy searchby}) {
    search = searchby;
    if (searchby == SearchBy.PRODUCTS) {
      filterBy = "Products";
    } else {
      filterBy = "Restaurants";
    }
    notifyListeners();
  }
}
