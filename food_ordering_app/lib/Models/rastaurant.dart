import 'package:cloud_firestore/cloud_firestore.dart';

class RastaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const RATING = "rating";
  static const RATES = "rates";

  int _id;
  String _name;
  String _image;
  double _avgprice;
  double _rating;
  bool _popular;
  int _rates;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  double get avgprice => _avgprice;
  double get rating => _rating;
  bool get popular => _popular;
  int get rates => _rates;

  RastaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _avgprice = snapshot.data()[AVG_PRICE];
    _rating = snapshot.data()[RATING];
    _popular = snapshot.data()[POPULAR];
    _rates = snapshot.data()[RATES];
  }
}
