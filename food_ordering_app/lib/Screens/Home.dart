import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/loginScreen.dart';
import 'package:food_ordering_app/Screens/products_searched.dart';
import 'package:food_ordering_app/Screens/rastaurant_searched.dart';
import 'package:food_ordering_app/Screens/shoppingBag.dart';
import 'package:food_ordering_app/providers/app.dart';
import 'package:food_ordering_app/providers/product.dart';
import 'package:food_ordering_app/providers/rastaurant.dart';
import 'package:food_ordering_app/providers/user.dart';
import 'package:food_ordering_app/widgets/BottomNavBar.dart';
import 'package:food_ordering_app/widgets/Loading.dart';
import 'package:food_ordering_app/widgets/catagories.dart';
import 'package:food_ordering_app/widgets/custom_widgets.dart';
import 'package:food_ordering_app/widgets/featured_products.dart';
import 'package:food_ordering_app/widgets/rastaurants.dart';
import 'package:food_ordering_app/widgets/smallButton.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  int active = 2;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.active = 2;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final rastaurantProvider = Provider.of<RastaurantProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // currentAccountPicture: Image.asset(
              //   'images/1.jpg',
              // ),
              accountEmail: CustomText(
                text: user.userModel.email,
                color: Colors.white,
                size: 16,
              ),
              accountName: CustomText(
                  text: user.userModel.name, color: Colors.white, size: 20),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              title: Text(
                "Food I like",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.food_bank_outlined,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              title: Text(
                "Cart",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              onTap: () => {
                Navigator.pop(context),
                ChangeScreen(context, ShoppingBag())
              },
            ),
            ListTile(
              title: Text(
                "My orders",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.bookmark_border,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              onTap: () {
                user.SignOut();
                ChangeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(
                Icons.exit_to_app,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        elevation: 0,
        title: CustomText(
          text: "Food App",
          fontWeight: FontWeight.bold,
          size: 24,
          color: Colors.white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_rounded),
                onPressed: () {},
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(active: 2),
      backgroundColor: Colors.white,
      body:
          // app.isloading
          //     ? Container(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [Loading()],
          //         ),
          //       )
          //     :
          SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        if (app.search == SearchBy.PRODUCTS) {
                          await productProvider.search(proname: pattern);
                          ChangeScreen(context, ProductSearchScreen());
                        } else {
                          await rastaurantProvider.search(rasname: pattern);
                          ChangeScreen(context, RastaurantSearchScreen());
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Find foods and Restaurants",
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomText(
                  text: "Search by:",
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
                DropdownButton<String>(
                  value: app.filterBy,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w300),
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.red,
                  ),
                  elevation: 0,
                  onChanged: (value) {
                    if (value == "Products") {
                      app.changeSearchby(searchby: SearchBy.PRODUCTS);
                    } else {
                      app.changeSearchby(searchby: SearchBy.RASTAURANTS);
                    }
                  },
                  items: <String>["Products", "Restaurants"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Catagories(),
            // Divider(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomText(
                text: 'Featured',
                size: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Featured(),
            SizedBox(
              height: 10,
            ),
            //Rastaurantwidget(),
//             Container(
//               height: 100,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 6,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () async {
// //
//                       },
//                       //  child: CategoryWidget(
//                       //   category: categoryProvider.categories[index],
//                       //  ),
//                     );
//                   }),
//             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular Rastaurants',
                size: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rastaurantProvider.rastaurants
                  .map((item) => GestureDetector(
                        onTap: () {},
                        child: Rastaurantwidget(
                          rastaurant: item,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
