import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/widgets/BottomNavBar.dart';
import 'package:food_ordering_app/widgets/catagories.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';
import 'package:food_ordering_app/widgets/featured_products.dart';
import 'package:food_ordering_app/widgets/smallButton.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavBar(active: 2),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomText(
                    text: "What would you like to eat ?",
                    size: 18,
                  ),
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
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1, 1),
                    blurRadius: 4)
              ]),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                trailing: Icon(
                  Icons.filter_list,
                  color: Colors.red,
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: "Find foods and Restaurants",
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Catagories(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomText(
                text: 'Featured',
                size: 20,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular',
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('images/4.jpg')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallButton(
                        icon: Icons.favorite,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow[900],
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 1),
                                child: Text('4.5'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ])),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(18, 8, 8, 16),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Burgers\n",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "by : ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "Pizza hut",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
                          child: Text(
                            "\$12.99\n",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
