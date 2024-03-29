import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const STRIPEID = "stripeId";

  String _name;
  String _email;
  String _id;
  String _stripeId;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;
  //UserModel({@required this._name, this._email, this._id});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _stripeId = snapshot.data()[STRIPEID];
  }
}
