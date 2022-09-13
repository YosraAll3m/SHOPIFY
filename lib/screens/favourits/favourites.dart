import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/states.dart';
import '../../styles/components/components.dart';
import '../mainScreen/mainScreen/cubit/cubit.dart';


class FavouritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopifyHomeCubit,ShopifyHomeStates>(
      listener: (context , state) {},
      builder: (context , state) {
        return ConditionalBuilder(
          condition: state  is ! ShopifyGetFavoritesLoadingState,
          builder: (context) =>

              ShopifyHomeCubit.get(context).favoritesModel.data.data.isNotEmpty?
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: Color(0xffFFF9FC),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1/ 1.72,
                    crossAxisCount: 2,
                    children:
                    List.generate(
                        ShopifyHomeCubit.get(context).favoritesModel.data.data.length,
                          (index) =>  builderGridView(ShopifyHomeCubit.get(context).favoritesModel.data.data[index].product,
                              context),
                    ),

                  ),
                ),
              ):

              Center(child:Lottie.asset("assets/search.json",animate: true,repeat: true,

              )),

          fallback: (context) => Center(child: CircularProgressIndicator()) ,

        );

      } ,

    ); ;
  }

}
