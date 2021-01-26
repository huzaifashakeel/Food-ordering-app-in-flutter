import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Models/Products.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';

class Details extends StatefulWidget {
  final Products products;

  Details({@required this.products});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      AssetImage('images/${widget.products.image}'),
                      AssetImage('images/${widget.products.image}'),
                      AssetImage('images/${widget.products.image}'),
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.red,
                    dotIncreaseSize: 1.5,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              'images/shop.jpg',
                              height: 30,
                              width: 30,
                              color: Colors.black,
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
                    ],
                  ),
                  Positioned(
                      right: 14,
                      bottom: 60,
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 3),
                                    blurRadius: 3)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.red,
                            ),
                          )))
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            //       child: RichText(
            //         text: TextSpan(children: [
            //           TextSpan(
            //               text: widget.products.name + "\n",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 22,
            //                   fontWeight: FontWeight.bold)),
            //           TextSpan(
            //               text: "By : Pizza Hut",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w600))
            //         ]),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text("\$" + widget.products.price.toString(),
            //           style: TextStyle(
            //               color: Colors.red,
            //               fontSize: 18,
            //               fontWeight: FontWeight.normal)),
            //     )

            //     // CustomText(
            //     //   text: "\$" + widget.products.price.toString(),
            //     //   size: 20,
            //     //   fontWeight: FontWeight.w500,
            //     // ),
            //   ],
            // ),
            CustomText(
              text: widget.products.name,
              size: 24,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: "\$" + widget.products.price.toString(),
              size: 18,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 36,
                    ),
                    onPressed: () {},
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(36, 12, 36, 12),
                      child: CustomText(
                        text: 'Add To Cart',
                        size: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                      size: 36,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
