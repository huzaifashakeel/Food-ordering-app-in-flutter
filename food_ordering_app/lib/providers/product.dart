import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Helpers/products.dart';
import 'package:food_ordering_app/Models/Products.dart';

class ProductProvider with ChangeNotifier {
  ProductService productService = ProductService();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];

  ProductProvider.initialize() {
    _loadrproducts();
  }

  //  Future loadProductsByCategory({String categoryName})async{
  //   productsByCategory = await productServices.getProductsOfCategory(category: categoryName);
  //   notifyListeners();
  // }

  _loadrproducts() async {
    products = await productService.getproducts();
    notifyListeners();
  }
}
