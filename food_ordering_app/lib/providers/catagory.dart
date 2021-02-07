import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Helpers/catagory.dart';
import 'package:food_ordering_app/Models/catagoryModel.dart';

class CatagoryProvider with ChangeNotifier {
  CatagoryService catagoryService = CatagoryService();
  List<CategoryModel> catagories = [];

  CatagoryProvider.initialize() {
    _loadcatagories();
  }

  _loadcatagories() async {
    catagories = await catagoryService.getcatagories();
    notifyListeners();
  }
}
