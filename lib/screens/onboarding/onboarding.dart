import 'package:flutter/material.dart';

import '../../widgets/onboarding_item.dart';



class OnBoardingScreen extends StatelessWidget{
  var boardController=PageController();
  bool  last=false;


  OnBoardingScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child:PageView(
          controller:boardController,
          children: [
            OnBoardingItem(image:"assets/onboarding1.json" , title: "Set Up Devices Easily",subtitle: "Welcome user, first of all, you can choose \nwhat you want to buy through this app..",),
            OnBoardingItem(image:"assets/onboarding3.json" ,title: "A new Voucher for NewComers",subtitle: "Put all products in carts and you will get a new\n voucher just if you share our application with your friends..",),
            OnBoardingItem(image:"assets/onboarding4.json" ,title: "Get Notified & Sales",subtitle: "You will get a notification of when the products will be delivered and a free delivery for the first order just from our application ..",),

          ],
          onPageChanged: (int index){
            if(index==2){
              last=index as bool;

            }else{
              last!=index as bool;

            }

          },),





      ),

    );
  }


}