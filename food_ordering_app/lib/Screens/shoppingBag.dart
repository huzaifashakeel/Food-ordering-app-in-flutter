import 'package:flutter/material.dart';
import 'package:food_ordering_app/Models/Products.dart';
import 'package:food_ordering_app/widgets/BottomNavBar.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Products product = Products(
      name: 'Cearals',
      image: '1.jpg',
      vendor: 'Good Foods',
      rating: 4.7,
      price: 10,
      wishlist: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(active: 3),
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: CustomText(
              text: "Shopping Bag",
              size: 24,
              fontWeight: FontWeight.bold,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 4),
                      child: Image.asset(
                        'images/shop.jpg',
                        height: 30,
                        width: 30,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: CustomText(
                          text: "2",
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 8),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 6),
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/${product.image}',
                      height: 110,
                      width: 110,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: product.name + '\n',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24)),
                          TextSpan(
                              text: ' \$' + product.price.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
