import 'package:flutter/material.dart';
import 'package:food_ordering_app/Models/catagory.dart';
import 'package:food_ordering_app/widgets/custom_Text.dart';

List<Catagory> catagorieslist = [
  Catagory(name: "salad", image: "salad.jpg"),
  Catagory(name: "steak", image: "steak.jpg"),
  Catagory(name: "Fast Food", image: "fastfood.png"),
  Catagory(name: "Desearts", image: "deserts.png"),
  Catagory(name: "Sea Food", image: "saafood.png"),
  Catagory(name: "Drinks", image: "drinks.png"),
];

class Catagories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catagorieslist.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey[50],
                          offset: Offset(4, 6),
                          blurRadius: 20)
                    ]),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image.asset(
                        "images/${catagorieslist[index].image}",
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    text: catagorieslist[index].name,
                  )
                ],
              ),
            );
          },
        ));
  }
}
