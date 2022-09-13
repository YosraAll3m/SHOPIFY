import 'package:flutter/material.dart';


class CatgoryCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context,index)=>
              Container(
                  padding: EdgeInsets.only(left: 5,top: 5),
                  height: 70,width: 90,margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10),),
                  child:Row(children: [
                    Icon(Icons.category_outlined, color:Color(0xffF94A7E),),
                    SizedBox(width: 5,),
                    Text("All",style: TextStyle(color: Color(0xff216188),
                        fontSize: 15,fontWeight: FontWeight.w500),)
                  ],)

              )
      ),
    );


  }
}