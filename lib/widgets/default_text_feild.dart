import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget{
  const DefaultTextField({Key key,this.controller,
    this.obscureText,this.title,this.validate,this.icon}) : super(key: key);
  final String title;
  final Icon icon;
  final Function validate;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText??true,
      decoration: InputDecoration(
        labelText: title,
        suffixIcon:icon ,
        filled: true,
        labelStyle:  TextStyle(color: Color(0xffF94A7E),
            fontSize: 20,fontWeight: FontWeight.w400),
        border: InputBorder.none,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Color(0xffF94A7E)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),          fillColor: Color(0xffFFF9FC    ),
        focusColor: Color(0xffFFF9FC  ),
      ),
      validator: validate,
      cursorColor:  Color(0xffF94A7E),

    );
  }
}