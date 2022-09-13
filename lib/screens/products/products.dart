import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/response/categories_response.dart';
import 'package:shopfiy_app/response/home_response.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/states.dart';

import '../mainScreen/mainScreen/cubit/cubit.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopifyHomeCubit,ShopifyHomeStates>(
        listener:  (context , state ) {
          if(state is ShopifySuccessFavoritesState) {
          }
        },
        builder: (context , state ) {
          return ConditionalBuilder(
              condition: ShopifyHomeCubit.get(context).homeModel != null &&
                  ShopifyHomeCubit.get(context).categoriesModel != null,
              builder: (context) => productsBuilder(ShopifyHomeCubit.get(context).homeModel,
                  ShopifyHomeCubit.get(context).categoriesModel, context) ,
          fallback: (context) => Center(child: CircularProgressIndicator(color: Color(0xffF94A7E),)),
          );



        },
         ) ;
  }
  Widget productsBuilder (HomeResponse model , CategoriesResponse categoriesModel,
      context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0,),


        CarouselSlider(
            items: model.data.banners.map((e) =>Container(
                 width: 380,
                 decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,
                   image:NetworkImage('${e.image}',),
                ),borderRadius: BorderRadius.circular(25)),
               ), ).toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              //the best shape
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),
       SizedBox(height: 10.0,),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',
            style: TextStyle(
              color: Color(0xff216188),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            ),
     SizedBox(height: 15,),
     Container(
             height: 100.0,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
               itemBuilder: (context , index) =>  categoriesBuilder (categoriesModel.data.data[index]),
                 separatorBuilder:(context , index) => SizedBox(width: 10.0,),
                 itemCount: categoriesModel.data.data.length,),
     ),
            SizedBox(height: 20.0,),
              Row(
                children: [
                  Text('New Products',
                    style: TextStyle(color: Color(0xff216188),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Text('View All',
                      style: TextStyle(color: Color(0xffF94A7E),
                        fontSize:16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                ],
              ),
          ],
        ),
      ),
        SizedBox(height: 10.0,),
        Container(
          color: Color(0xffFFF9FC),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1/ 1.72,
            crossAxisCount: 2, //number of them
            children:
              List.generate(
                  model.data.products.length,
                      (index) => builderGridView(model.data.products[index],context ),
              ),

     ),
        ),
      ],
    ),
  );
}
Widget categoriesBuilder (DataModel model) =>  Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(image: NetworkImage(model.image),
      height: 100.0,
      width: 100.0,
      fit: BoxFit.cover,
    ),
    Container(
      color: Colors.black.withOpacity(.8),
      width: 100.0,
      child: Text(model.name,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,

        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ],
);

Widget builderGridView (ProductsModel model , context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(    color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [ Image(image: NetworkImage(model.image),
              width: double.infinity,
                height: 200.0,
              ),
                if(model.discount != 0)
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                      if(model.discount != 0)
                      Text(
                        '\$${model.old_price.round()}',

                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,

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

          ],
        ),
      ),
    );


