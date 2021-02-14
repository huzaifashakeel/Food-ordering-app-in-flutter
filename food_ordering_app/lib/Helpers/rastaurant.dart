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

  Future<RastaurantModel> getRestaurantById({String id}) =>
      _firestore.collection(rastaurantcollection).doc(id).get().then((doc) {
        return RastaurantModel.fromSnapshot(doc);
      });

  Future<List<RastaurantModel>> searchrastaurant({String rastaurantname}) {
    String searchname =
        rastaurantname[0].toUpperCase() + rastaurantname.substring(1);
    return _firestore
        .collection(rastaurantcollection)
        .orderBy("name")
        .startAt([searchname])
        .endAt([searchname + 'uf8ff'])
        .get()
        .then((result) {
          List<RastaurantModel> rastaurants = [];
          for (DocumentSnapshot rastaurant in result.docs) {
            rastaurants.add(RastaurantModel.fromSnapshot(rastaurant));
          }
          return rastaurants;
        });
  }
}
