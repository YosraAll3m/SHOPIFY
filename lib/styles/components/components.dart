import 'package:flutter/material.dart';
import 'package:shopfiy_app/styles/colors.dart';

import '../../screens/mainScreen/mainScreen/cubit/cubit.dart';


void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(
  builder:
      (context) => widget, ));

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
  builder:
      (context) => widget,
      ),
        (route){
      return false;
    }
);
Widget defaultField( {
  @required TextEditingController controller,
  Function onSubmitted,
  bool isPassword = false ,
  @required Function validate,
  @required  String label,
  Function onChange,
  @required IconData prefix,
  IconData suffix,
  Function onpressed,
  @required TextInputType keyboard,
}) => TextFormField(

  controller: controller,
  keyboardType: keyboard,
  obscureText: isPassword,
  onChanged: onChange,
  onFieldSubmitted: onSubmitted,
  validator: validate,
  decoration: InputDecoration(

    labelText: label,
    suffixIcon: suffix != null ? IconButton(icon : Icon (suffix,color:  Color(0xffF94A7E),) , onPressed: onpressed,) : null ,
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

  cursorColor:  Color(0xffF94A7E),

);
Widget defaultButton({
  double width =  double.infinity,
  double height = 40.0,
  double radius = 0.0,
  bool isUpperCase = true,
  @required String text,
  @required Function onTaped,
}) =>  Container(height:50,width: double.infinity,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color:  Color(0xffF94A7E)),
    child: InkWell(
      onTap:onTaped?? () {},
      child: Center(child: Text(text.toUpperCase(),
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
          ,color: Colors.white),)),));

Widget defaultTextButton ({
  @required String text,
  @required Function function,
})=>
     TextButton(onPressed: function, child: Text(text.toUpperCase()),);
 enum ToastStates {SUCCESS, ERROR, WARNING}


void printLongString(String text) {
  final RegExp pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
}
Widget myDivider ()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    color: Colors.grey[400],

    height: 1.0,
  ),
);

Widget builderGridView ( model , context,{bool isOldPrice = false}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(    color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: NetworkImage(model.image),
              width: double.infinity,
              height: 200.0,
            ),


            Text(
              model.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                //بيخلي الكلام قريب من بعضه
                height: 1.3,

              ),
            ),
            Row(
              children: [
                Text(
                  '\$${model.price.round()}',

                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff216188),

                  ),
                ),
                SizedBox(width: 5.0,),
                if(model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0,),
                    child: Text('DISCOUNT',
                      style: TextStyle(fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                Spacer(),
                IconButton(
                    onPressed: (){
                      ShopifyHomeCubit.get(context).changeFavorites(model.id);
                      print(model.id);
                    },
                    icon: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color:ShopifyHomeCubit.get(context).favorites[model.id] ?
                          Color(0xffF94A7E) :  Color(0xffFFF9FC),

                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.favorite,
                          size: 20.0,

                          color: ShopifyHomeCubit.get(context).favorites[model.id] ?
                          Colors.white :  Color(0xffF94A7E) ),

                    )),

              ],
            ),



          ],
        ),
      ),
    );
Widget buildListItem ( model , context , {bool isOldPrice = false}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [ Image(
            image: NetworkImage(model.image),
            width: 120.0,
            height: 120.0,

          ),
            if(model.discount != 0 && isOldPrice)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 5.0,),
                child: Text('DISCOUNT',
                  style: TextStyle(fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
          ], ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  //بيخلي الكلام قريب من بعضه
                  height: 1.3,

                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price.toString(),

                    style: TextStyle(
                      fontSize: 12.0,
                      color: defaultColor,

                    ),
                  ),
                  SizedBox(width: 5.0,),
                  if(model.discount != 0 && isOldPrice)
                    Text(
                      model.oldPrice.toString(),

                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,

                      ),
                    ),
                  Spacer(),
                  // IconButton(
                  //   onPressed: (){
                  //     ShopHomeCubit.get(context).changeFavorites(model.id);
                  //     //  print(model.id);
                  //   },
                  //   icon: CircleAvatar(
                  //     radius: 15.0,
                  //     backgroundColor:
                  //     ShopHomeCubit.get(context).favorites[model.id]
                  //         ? Colors.red
                  //         : Colors.grey,
                  //     child: Icon(Icons.favorite_border_outlined,
                  //       size: 14.0,
                  //
                  //       color: Colors.white,),
                  //   ),),
                ],
              ),

            ],
          ),
        ),

      ],
    ),
  ),
);