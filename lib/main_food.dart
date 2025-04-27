// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/food_page_body.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import '../widget/big_text.dart';
import '../widget/small_text.dart';
import 'package:flutter_application_1/pages/recomanded_food_datail.dart';

class MainFood extends StatefulWidget {
  const MainFood({Key? key}) : super(key: key);

  @override
  _MainFoodState createState() => _MainFoodState();
}

class _MainFoodState extends State<MainFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.height20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Make the Rwanda/Kigali part clickable
              GestureDetector(
                onTap: () {
                  // action when the Rwanda/Kigali container is tapped
                  Navigator.push(context,
                    
                    MaterialPageRoute(builder: (context)=>RecomandedFoodDatail())
                   );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BigText(text: "Rwanda"),
                    Row(
                      children: [
                        SmallText(text: "Kigali"),
                        Icon(Icons.arrow_drop_down_circle_rounded)
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // action when the Search icon container is tapped
                    print("Search tapped");
                  },
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: const Color(0xFFcccaca),
                    ),
                    child: Icon(Icons.search,
                        color: Colors.white, size: Dimensions.iconSize24),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        ))
      ]),
    );
  }
}
