import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Helpers/products.dart';
import 'package:food_ordering_app/Models/Products.dart';

class ProductProvider with ChangeNotifier {
  ProductService productService = ProductService();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsbyRastaurants = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    _loadrproducts();
    search(proname: "b");
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await productService.getproductsofparticularcatagory(categoryName);
    notifyListeners();
  }

  Future loadproductsbyRastaurants({int id}) async {
    productsbyRastaurants = await productService.getproductsbyRastaurants(id);
    notifyListeners();
  }

  _loadrproducts() async {
    products = await productService.getproducts();
    notifyListeners();
  }

  Future search({String proname}) async {
    productsSearched =
        await productService.searchproducts(productname: proname);
    notifyListeners();
  }
}
