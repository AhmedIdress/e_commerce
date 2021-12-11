import 'package:e_commerce/view/main/home_view/explore_view/best_selling_part.dart';
import 'package:e_commerce/view/main/home_view/explore_view/categories.dart';
import 'package:flutter/material.dart';

 class ExploreView extends StatelessWidget {
   const ExploreView({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Padding(
         padding: const EdgeInsets.only(
           top: 20.0,
           left: 20.0,
           right: 20.0,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               decoration: BoxDecoration(
                 color: Colors.grey.shade200,
                 borderRadius: BorderRadius.circular(25.0),
               ),
               child: TextFormField(
                 decoration: const InputDecoration(
                   enabledBorder: InputBorder.none,
                   prefixIcon: Icon(
                     Icons.search,
                     color: Colors.black,
                   ),
                   focusedBorder: InputBorder.none,
                 ),
               ),
             ),
             const SizedBox(
               height: 40,
             ),
             const CategoriesPart(),
             const SizedBox(
               height: 20,
             ),
             const BestSellingPart(),
           ],
         ),
       ),
     );
   }
 }
