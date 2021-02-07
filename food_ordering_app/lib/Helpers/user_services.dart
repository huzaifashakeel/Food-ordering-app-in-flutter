import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ordering_app/Models/users.dart';

class UserServices {
  String usercollection = 'Users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  void create_user(Map<String, dynamic> values) {
    _firestore.collection(usercollection).doc(values["id"]).set(values);
  }

  void update_user(Map<String, dynamic> values) {
    _firestore.collection(usercollection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserbyid(String id) =>
      _firestore.collection(usercollection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  // Future<void> addUser() async {
  //   await Firebase.initializeApp();
  //   return users
  //       .add({
  //         'name': 'Huzaifa',
  //         'email': 'Huzaifashakeel778@gmail.com',
  //         'id': '123',
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user"));
  // }
}
