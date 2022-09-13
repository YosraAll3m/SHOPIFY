import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/cubit.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/states.dart';
import 'package:shopfiy_app/styles/components/components.dart';

import '../../search/search.dart';



class MainScreenView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopifyHomeCubit,ShopifyHomeStates>(
      listener: (context , state)  {},
      builder: (context , state) {
        var cubit = ShopifyHomeCubit.get(context);
        return    Scaffold(
          backgroundColor:Color(0xffFFF9FC),
          appBar: AppBar(
            backgroundColor:Color(0xffF94A7E) ,

            title:  Text("Shopify".toUpperCase()),
           actions:[
             IconButton(onPressed: (){
             navigateTo(context, SearchScreen());
           }, icon: Icon(Icons.search,),),

           ]
          ),
          body : cubit.screens[cubit.currentIndex]  ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              hoverElevation: 10,
              backgroundColor:Color(0xffF94A7E) ,
              onPressed: (){
              },
              child: Icon(Icons.shopping_cart,color: Colors.white,)
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 5.5,
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor:  Color(0xffF94A7E),
              unselectedItemColor: Colors.grey.shade400,
              currentIndex: cubit.currentIndex,
              onTap: (index){
              cubit.changeBottomScreen(index);
              },
              items:               [
                BottomNavigationBarItem(
                  label:"Home",
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),

                ),
                BottomNavigationBarItem(
                  label:"Category",
                  icon:  Icon(
                    Icons.category_outlined,
                    size: 25,
                  ),
                ),
                BottomNavigationBarItem(
                  label:"Favorite",
                  icon:  Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

  );


    },
    );

  }
}
