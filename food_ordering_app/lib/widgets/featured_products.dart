import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Models/Products.dart';
import 'package:food_ordering_app/Screens/details.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';

List<Products> productList = [
  Products(
      name: 'Cearals',
      image: '1.jpg',
      vendor: 'Good Foods',
      rating: 4.7,
      price: 10,
      wishlist: true),
  Products(
      name: 'Taccos',
      image: '2.jpg',
      vendor: 'KFC',
      rating: 4.2,
      price: 15.99,
      wishlist: false),
  Products(
      name: 'Fast food',
      image: '3.jpg',
      vendor: 'Good Foods',
      rating: 4.9,
      price: 14.66,
      wishlist: true)
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                ChangeScreen(
                    context,
                    Details(
                      products: productList[index],
                    ));
              },
              child: Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100],
                      offset: Offset(15, 5),
                      blurRadius: 30)
                ]),
                child: Column(
                  children: [
                    Image.asset(
                      'images/${productList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productList[index].name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: productList[index].wishlist
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 18,
                                      )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomText(
                                text: productList[index].rating.toString(),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: "\$${productList[index].price}",
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
