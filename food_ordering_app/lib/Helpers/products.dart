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
}
