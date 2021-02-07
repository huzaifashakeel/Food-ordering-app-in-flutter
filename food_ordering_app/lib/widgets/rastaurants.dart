import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Models/rastaurant.dart';
import 'package:food_ordering_app/Screens/rastaurant.dart';
import 'package:food_ordering_app/widgets/Loading.dart';
import 'package:food_ordering_app/widgets/smallButton.dart';
import 'package:transparent_image/transparent_image.dart';

class Rastaurantwidget extends StatelessWidget {
  final RastaurantModel rastaurant;

  const Rastaurantwidget({Key key, this.rastaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("rastaurant model : " + rastaurant.toString());
    return Container(
        height: 250,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ChangeScreen(context,
                            RestaurantScreen(restaurantModel: rastaurant));
                      },
                      child: Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: rastaurant.image,
                        ),
                      ),
                    )
                    // Image.network(
                    //   catagoryProvider.catagories[index].image,
                    //   width: 150,
                    //   height: 100,
                    // ),
                  ],
                ),
              ),
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
                            child: Text(rastaurant.rating.toString()),
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
                            text: "${rastaurant.name}\n",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Average meal price : ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: rastaurant.avgprice.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
