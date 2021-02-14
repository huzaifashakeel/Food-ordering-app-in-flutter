import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ordering_app/Models/Products.dart';

class ProductService {
  String productcollection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getproducts() async =>
      _firestore.collection(productcollection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> getproductsbyRastaurants(int id) async =>
      _firestore
          .collection(productcollection)
          .where("restaurantId", isEqualTo: id)
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> getproductsofparticularcatagory(
          String catagoryname) async =>
      _firestore
          .collection(productcollection)
          .where("category", isEqualTo: catagoryname)
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchproducts({String productname}) {
    String searchname = productname[0].toUpperCase() + productname.substring(1);
    return _firestore
        .collection(productcollection)
        .orderBy("name")
        .startAt([searchname])
        .endAt([searchname + 'uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
