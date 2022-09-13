import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget{
  const DefaultButton({Key key,this.onTaped,this.title,this.color}) : super(key: key);
  final String title;
  final Color color;
  final Function onTaped;

  @override
  Widget build(BuildContext context) {
    return Container(height:50,width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: color),
        child: InkWell(
          onTap:onTaped?? () {},
          child: Center(child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
              ,color: Colors.white),)),));

  }
}