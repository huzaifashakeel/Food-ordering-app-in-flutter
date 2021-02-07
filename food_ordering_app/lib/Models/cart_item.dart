import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const NAME = "name";
  static const PRICE = "price";
  static const IMAGE = "image";
  static const QUANTITY = "quantity";

  int _id;
  String _productId;
  String _name;
  String _image;
  double _price;
  double _quantity;

  int get id => _id;
  String get productId => _productId;
  String get name => _name;
  String get image => _image;
  double get price => _price;
  double get quantity => _quantity;

  ItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _productId = snapshot.data()[PRODUCT_ID];
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _price = snapshot.data()[PRICE];
    _quantity = snapshot.data()[QUANTITY];
  }
}
