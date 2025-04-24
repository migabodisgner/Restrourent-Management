// ignore_for_file: unused_import, unnecessary_import, use_super_parameters, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widget/app_column.dart';
import 'package:flutter_application_1/widget/app_icon.dart';
import 'package:flutter_application_1/widget/big_text.dart';
import 'package:flutter_application_1/widget/expandeble_text_widget.dart';
import 'package:flutter_application_1/widget/small_text.dart';
import 'package:flutter_application_1/widget/icon_and_text_widget.dart';
class PopularFoodDetail extends StatelessWidget{
  const PopularFoodDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Images/fruit.jpg"))
              ),
            ),
          ),
            //icons widget
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 AppIcon(icon: Icons.arrow_back_ios),
                 AppIcon(icon: Icons.shopping_cart_outlined)
               ], 
             )),
            // introduction
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize-20,
                child: Container(
                         padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20,),
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20)
                          ),
                          color: Colors.white
                         ), 
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                           AppColumn(text: "Self service"),
                           SizedBox(height: Dimensions.height20),
                           BigText(text: "Introduce"),
                           SizedBox(height: Dimensions.height20),
                           //expandeble text widget
                            
                           Expanded(child: 
                           SingleChildScrollView(
                            child: ExpandebleTextWidget(text: "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment. ⏰⏰🚛🚛Multivendor app https://youtu.be/NHlVuQpy8B4 https://www.dbestech.com/tutorials/flutter-multi-vendor-app 😀😀😃Motivate my work https://www.buymeacoffee.com/dbestech/e/79321 About my Palestinien brother https://www.youtube.com/watch?v=HnZSaKYmP2s ⏫⏫⏫⏫🔥🔥Bloc advanced code(e-commerce app) https://youtu.be/KfVf67MtqiY Buy me a coffee https://www.buymeacoffee.com/dbestech/e/79321 Flutter E-commerce app tutorial part 2 https://youtu.be/GQJovou6zuE Flutter E-commerce app tutorial part 4 https://youtu.be/sJoJVmk1M8Y Get the source code of this food ordering app with ui and backend as you saw in the demo section of this video here https://www.dbestech.com/tutorials/flutter-food-delivery-app-e-commerce-for-ios-and-android Task management app https://www.dbestech.com/tutorials/flutter-task-management-app-with-restful-api This tutorial for beginners to advanced. This app development tutorial covers a complete app as a project. This app uses Getx as state management system. (not speed code, not the flutter way) twitter @dbestech Get the quick access to the code for the shopping app from Patreon https://www.patreon.com/posts/61833613 Get the quick access to the code for the quiz app from Patreon https://www.patreon.com/posts/63323762 Major features 1. Show products based on")
                            ),
                              )
                           ],
                         )   
              )
              )
                 
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.purple,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add,color: Colors.purple,)
                ],
              ),
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
    );
  }
}