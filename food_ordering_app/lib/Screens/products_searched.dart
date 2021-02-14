import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/details.dart';
import 'package:food_ordering_app/providers/product.dart';
import 'package:food_ordering_app/widgets/custom_widgets.dart';
import 'package:food_ordering_app/widgets/productwidget.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Products",
          size: 20,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: "No products Found",
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      size: 22,
                    ),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      ChangeScreen(
                          context,
                          Details(
                              product:
                                  productProvider.productsSearched[index]));
                    },
                    child: ProductWidget(
                        product: productProvider.productsSearched[index]));
              }),
    );
  }
}
