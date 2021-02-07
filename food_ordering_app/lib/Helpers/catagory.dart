import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ordering_app/Models/catagoryModel.dart';

class CatagoryService {
  String catagorycollection = "catagories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getcatagories() async =>
      _firestore.collection(catagorycollection).get().then((result) {
        List<CategoryModel> catagories = [];
        for (DocumentSnapshot catagory in result.docs) {
          catagories.add(CategoryModel.fromSnapshot(catagory));
        }
        return catagories;
      });
}
