// ignore_for_file: unnecessary_import, use_super_parameters, sort_child_properties_last, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widget/app_icon.dart';
import 'package:flutter_application_1/widget/big_text.dart';
import 'package:flutter_application_1/widget/expandeble_text_widget.dart';

class RecomandedFoodDatail extends StatelessWidget{
  const RecomandedFoodDatail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(20), 
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              color: Colors.white,
              child: Center( 
                child: BigText(size: Dimensions.font26, text: "Self Service"),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              
            ),),
            
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/Images/food2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandebleTextWidget(text: "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment. ⏰⏰🚛🚛Multivendor app https://youtu.be/NHlVuQpy8B4 https://www.dbestech.com/tutorials/flutter-multi-vendor-app 😀😀😃Motivate my work https://www.buymeacoffee.com/dbestech/e/79321 About my Palestinien brother https://www.youtube.com/watch?v=HnZSaKYmP2s ⏫⏫⏫⏫🔥🔥Bloc advanced code(e-commerce app) https://youtu.be/KfVf67MtqiY Buy me a coffee https://www.buymeacoffee.com/dbestech/e/79321 Flutter E-commerce app tutorial part 2 https://youtu.be/GQJovou6zuE Flutter E-commerce app tutorial part 4 https://youtu.be/sJoJVmk1M8Y Get the source code of this food ordering app with ui and backend as you saw in the demo section of this video here https://www.dbestech.com/tutorials/flutter-food-delivery-app-e-commerce-for-ios-and-android Task management app https://www.dbestech.com/tutorials/flutter-task-management-app-with-restful-api This tutorial for beginners to advanced. This app development tutorial covers a complete app as a project. This app uses Getx as state management system. (not speed code, not the flutter way) twitter @dbestech Get the quick access to the code for the shopping app from Patreon https://www.patreon.com/posts/61833613 Get the quick access to the code for the quiz app from Patreon https://www.patreon.com/posts/63323762 Major features 1. Show products based on"),
                 
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ) 
            ),
        ],
      ),
         bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
            ),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor: Colors.white,
                backgroundColor: Colors.deepPurple, 
                icon:Icons.remove),

                BigText(text: " \$ 12.88 "+" x "+" 0 ", color: Colors.grey,size: Dimensions.font26,),

                AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor: Colors.white,
                backgroundColor: Colors.deepPurple, 
                icon:Icons.add),
                
            ],
            ),
            Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.font20,bottom: Dimensions.height30, left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: Color.fromARGB(33, 43, 111, 222),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20*2), topRight: Radius.circular(Dimensions.radius20*2)
           )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.cyanAccent
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.deepOrange,)
            ),
            
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "\$10 | Add to cart", color: Colors.black45,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.tealAccent
              ),
            ),
          ],
        ),
      ),
          ],
         ),
    );
  }
}