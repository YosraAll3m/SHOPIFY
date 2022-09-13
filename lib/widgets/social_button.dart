import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget{
  const SocialButton({Key key,this.image}) : super(key: key);
  final String image;


  @override
  Widget build(BuildContext context) {
    return Container(height:30,width: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Color(0xffFEFCFE)),
        child: InkWell(onTap: (){},
            child: Center(child: Image(image: AssetImage(image),),)));

  }
}