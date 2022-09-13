import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/cubit.dart';

import '../../response/categories_response.dart';
import '../mainScreen/mainScreen/cubit/states.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopifyHomeCubit,ShopifyHomeStates>(
    listener: (context , state) {},
    builder: (context , state) {
      return ListView.separated(itemBuilder: (context , index) =>
          buildCatItem(ShopifyHomeCubit.get(context).categoriesModel.data.data[index]),
        separatorBuilder: (context , index) => SizedBox () ,
        itemCount: ShopifyHomeCubit.get(context).categoriesModel.data.data.length,);

    } ,

    );
  }
}
Widget buildCatItem(DataModel model ) => Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Image(image:
        NetworkImage(model.image),
          fit: BoxFit.cover,
          width: 100.0,
        ),
        SizedBox(width:
          10,),
        Text(model.name,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff216188),
            fontWeight: FontWeight.w500
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: Color(0xffF94A7E)),


      ],
    ),
  ),
);
