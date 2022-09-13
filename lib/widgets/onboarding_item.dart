import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/auth/sign_or_create/sign_or_create.dart';



class OnBoardingItem extends StatelessWidget{
  OnBoardingItem({Key key,this.image,this.title,this.subtitle}) : super(key: key);
  final String image,
      title,subtitle;

  var boardController=PageController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30,),

        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SignOrCreate()));

            },
              child: Text("Skip",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                      ,color: Color(0xffF94A7E))),
            ),
          ],
        ),

        SizedBox(height: 80,),
        Center(
            child: Lottie.asset(image,animate: true,repeat: true,)
        ),
        SizedBox(height: 20,),

        Text(title,
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
                ,color: Color(0xffF94A7E))),
        SizedBox(height: 20,),

        Text(subtitle,
          style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.w400
              ,color: Color(0xff216188)),),
        Spacer(),

        Row(
          children: [
            SmoothPageIndicator(controller: boardController,
              count:3,
              effect:WormEffect(dotColor:Colors.grey.shade300,spacing: 7,
                dotWidth:  18.0,
                activeDotColor:Color(0xffF94A7E),
                dotHeight: 15,

              ),  ),
            Spacer(),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SignOrCreate()));
            },
              child: Container( height: 55,width: 55,decoration: BoxDecoration(
                  color: Color(0xffF94A7E),borderRadius: BorderRadius.circular(30)
              ),child:Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
              ),),

          ],
        ),

      ],
    );

  }
}