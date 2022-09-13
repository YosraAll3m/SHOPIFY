import 'package:flutter/material.dart';



class SearchBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:320,
        height: 50,
        decoration: BoxDecoration(color: Colors.white,
            // borderRadius: BorderRadius.circular(25),
            boxShadow:[BoxShadow(color:Colors.grey.shade400,blurRadius: 3)]
        ),
        child: TextFormField(
          decoration: InputDecoration(fillColor: Colors.white,
              labelText: "Search",
              suffixIcon:Icon(Icons.search,color:  Color(0xffF94A7E),) ,
              filled: true,
              labelStyle:  TextStyle(color: Color(0xffF94A7E),
                  fontSize: 17,fontWeight: FontWeight.w400),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:  Colors.white),
                borderRadius: BorderRadius.circular(15.0),
              )
          ),
          cursorColor:  Color(0xffF94A7E),

        ),
      ),
    );
  }
}