import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/productcatagory.dart';
import 'package:food_ordering_app/providers/app.dart';
import 'package:food_ordering_app/providers/catagory.dart';
import 'package:food_ordering_app/providers/product.dart';
import 'package:food_ordering_app/widgets/Loading.dart';
import 'package:food_ordering_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Catagories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catagoryProvider = Provider.of<CatagoryProvider>(context);
    final productprovider = Provider.of<ProductProvider>(context);
    //final appProvider = Provider.of<AppProvider>(context);
    return Container(
        height: 100,
        //width: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catagoryProvider.catagories.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          ),
                        ),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: catagoryProvider.catagories[index].image,
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
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () async {
                        //  appProvider.changeloading();
                        await productprovider.loadProductsByCategory(
                            categoryName:
                                catagoryProvider.catagories[index].name);
                        // appProvider.changeloading();
                        ChangeScreen(
                            context,
                            CategoryScreen(
                              categoryModel: catagoryProvider.catagories[index],
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            //color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  // Colors.black.withOpacity(0.8),
                                  // Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  // Colors.black.withOpacity(0.05),
                                  // Colors.black.withOpacity(0.025),
                                ])),
                        child: Center(
                          child: CustomText(
                            text: catagoryProvider.catagories[index].name,
                            color: Colors.white,
                            size: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //padding: const EdgeInsets.fromLTRB(30, 20, 8, 40),
                  //  child:

                  //  )
                ],
              ),
            );
          },
        ));
  }
}
