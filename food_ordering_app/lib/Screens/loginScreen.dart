import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/Home.dart';
import 'package:food_ordering_app/Screens/RegistraionScreen.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.jpg',
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: "Login",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    children: <TextSpan>[
                  TextSpan(
                    text: " into your Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  )
                ])),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 30, 12, 12),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 6),
                        blurRadius: 10,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        icon: Icon(Icons.email)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 24, 12, 12),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 6),
                        blurRadius: 10,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 24, 12, 12),
              child: Container(
                height: 50,
                width: 250,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      ChangeScreenReplacement(context, Home());
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.red,
                    child: CustomText(
                      text: "Login",
                      size: 20,
                      color: Colors.white,
                    )),
              ),
            ),
            FlatButton(
                child: CustomText(
                  text: 'Register Now',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                onPressed: () => {ChangeScreen(context, RegstraionScreen())})
          ],
        ),
      ),
    );
  }
}
