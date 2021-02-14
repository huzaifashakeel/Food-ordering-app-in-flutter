// import 'package:flutter/material.dart';
// import 'package:food_ordering_app/Models/catagoryModel.dart';
// import 'package:food_ordering_app/widgets/Loading.dart';
// import 'package:food_ordering_app/widgets/custom_widgets.dart';
// import 'package:transparent_image/transparent_image.dart';

// class CategoryWidget extends StatelessWidget {
//   final CategoryModel category;

//   const CategoryWidget({Key key, this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(6),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             width: 140,
//             height: 160,
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(30),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned.fill(
//                         child: Align(
//                       alignment: Alignment.center,
//                       child: Loading(),
//                     )),
//                     Center(
//                       child: FadeInImage.memoryNetwork(
//                           placeholder: kTransparentImage,
//                           image: category.image),
//                     )
//                   ],
//                 )),
//           ),
//           Container(
//             width: 140,
//             height: 160,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.6),
//                     Colors.black.withOpacity(0.6),
//                     Colors.black.withOpacity(0.6),
//                     Colors.black.withOpacity(0.4),
//                     Colors.black.withOpacity(0.1),
//                     Colors.black.withOpacity(0.05),
//                     Colors.black.withOpacity(0.025),
//                   ],
//                 )),
//           ),
//           Positioned.fill(
//               child: Align(
//                   alignment: Alignment.center,
//                   child: CustomText(
//                     text: category.name,
//                     color: Colors.white,
//                     size: 26,
//                     fontWeight: FontWeight.w300,
//                   )))
//         ],
//       ),
//     );
//   }
// }
