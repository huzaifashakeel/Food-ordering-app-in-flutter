import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Screens/Home.dart';
import 'package:food_ordering_app/Screens/loginScreen.dart';
import 'package:food_ordering_app/providers/app.dart';
import 'package:food_ordering_app/providers/catagory.dart';
import 'package:food_ordering_app/providers/product.dart';
import 'package:food_ordering_app/providers/rastaurant.dart';
import 'package:food_ordering_app/providers/user.dart';
import 'package:food_ordering_app/widgets/Loading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CatagoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RastaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenController(),
      )));
}

class ScreenController extends StatelessWidget {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.uninitialized:
        return Loading();
        break;
      case Status.unauthenticated:
      case Status.authenticating:
        return LoginScreen();
        break;
      case Status.authenticated:
        return LoginScreen();
        break;
    }
  }
}
