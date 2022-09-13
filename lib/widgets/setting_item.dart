import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget{
  final String title;
  final Icon icon;
  final IconButton sufixIcon;
  final Function onTaped;
  SettingItem({
    this.title,
    this.icon,
    this.sufixIcon,
    this.onTaped
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(onTap: onTaped,
          child: Row(children: [
            Stack(
              children: [
                Container(
                  height:35,width:35,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff216188),

                        Color(0xffF94A7E)  ,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Positioned(top: 25,left: 25,child: icon),
              ],
            ),
            SizedBox(width: 10,),
            Text(title,style: TextStyle(color: Color(0xff216188)),),
            Spacer(),
            sufixIcon,


          ],),
        ),
        Divider(color: Color(0xff216188),)
      ],
    );

  }}