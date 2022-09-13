import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/styles/components/components.dart';
import 'package:shopfiy_app/widgets/setting_item.dart';

import '../../styles/components/constans.dart';
import '../favourits/favourites.dart';
import '../mainScreen/mainScreen/cubit/cubit.dart';
import '../mainScreen/mainScreen/cubit/states.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopifyHomeCubit, ShopifyHomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopifyHomeCubit.get(context).userModel;
          return Scaffold(
              backgroundColor: Color(0xffFFF9FC),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff216188),
                                Color(0xffF94A7E),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/profile.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(45)),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            right: 30,
                            child: IconButton(
                              onPressed: () {
                                navigateTo(context, ProfileScreen());
                              },
                              icon: Icon(
                                Icons.edit_note_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            )),
                        Positioned(
                          top: 50,
                          left: 110,
                          child: Column(
                            children: [
                              Text(
                                model.data==null?" ":
                                "${model.data.name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SettingItem(
                      onTaped: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>FavouritesScreen()));
                      },
                      title: "Favourites",
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      title: "Languages",
                      icon: Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      title: "Change Theme",
                      icon: Icon(
                        Icons.mode_night,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      title: "Notification",
                      icon: Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      title: "my order",
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      title: "FQS",
                      icon: Icon(
                        Icons.question_answer,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                    SettingItem(
                      onTaped: () {
                        signOut(context);
                      },
                      title: "Logout",
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp,
                            color: Color(0xffF94A7E)),
                      ),
                    ),
                  ],
                ),
              )));
        });
  }
}
