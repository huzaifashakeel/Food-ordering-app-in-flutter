import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ordering_app/Models/rastaurant.dart';

class RastaurantService {
  String rastaurantcollection = "rastaurants";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RastaurantModel>> getrastaurants() async =>
      _firestore.collection(rastaurantcollection).get().then((result) {
        List<RastaurantModel> rastaurants = [];
        for (DocumentSnapshot rastaurant in result.docs) {
          rastaurants.add(RastaurantModel.fromSnapshot(rastaurant));
        }
        return rastaurants;
      });
}
