import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/Home.dart';
import 'package:food_ordering_app/Screens/loginScreen.dart';
import 'package:food_ordering_app/providers/user.dart';
import 'package:food_ordering_app/widgets/Loading.dart';
import 'package:food_ordering_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class RegstraionScreen extends StatefulWidget {
  @override
  _RegstraionScreenState createState() => _RegstraionScreenState();
}

class _RegstraionScreenState extends State<RegstraionScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: authProvider.status == Status.authenticating
          ? Loading()
          : SingleChildScrollView(
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
                          text: "Register",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          children: <TextSpan>[
                        TextSpan(
                          text: " yourself",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        )
                      ])),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 30, 12, 2),
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
                          controller: authProvider.name,
                          decoration: InputDecoration(
                              hintText: "Username",
                              border: InputBorder.none,
                              icon: Icon(Icons.person)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 30, 12, 2),
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
                          controller: authProvider.email,
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
                          controller: authProvider.password,
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
                          onPressed: () async {
                            if (!await authProvider.SignUp()) {
                              _key.currentState.showSnackBar(SnackBar(
                                content: Text("Registration Failed"),
                              ));
                              authProvider.CleanControllers();
                              return;
                            }
                            authProvider.CleanControllers();
                            ChangeScreenReplacement(context, Home());
                            // ChangeScreenReplacement(context, Home());
                          },
                          padding: EdgeInsets.all(12),
                          color: Colors.red,
                          child: CustomText(
                            text: "Register",
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  FlatButton(
                      child: CustomText(
                        text: 'Already have an Account?',
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                      onPressed: () =>
                          {ChangeScreenReplacement(context, LoginScreen())})
                ],
              ),
            ),
    );
  }
}
