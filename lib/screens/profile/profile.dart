import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/styles/components/components.dart';

import '../mainScreen/mainScreen/cubit/cubit.dart';
import '../mainScreen/mainScreen/cubit/states.dart';


class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopifyHomeCubit,ShopifyHomeStates>
      (
      listener:  (context , state) {

      },
      builder: (context , state){
        var model = ShopifyHomeCubit.get(context).userModel;
        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return   Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffF94A7E),
            leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_sharp),
              onPressed: (){
                Navigator.pop(context);
              },

            ),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:150 ,),
                ConditionalBuilder(
                  condition: ShopifyHomeCubit.get(context).userModel != null  ,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [

                          Container(
                           height: 80,
                           width: 80,
                            decoration: BoxDecoration(color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(45)),
                         
                        child: Icon(Icons.person,color: Colors.grey,size: 35,),),
                          SizedBox(height: 20.0,),

                          userData(context),
                          defaultButton(text: 'Update',
                              onTaped:(){
                                if(formKey.currentState.validate()) {
                                  ShopifyHomeCubit.get(context).UpdateUserData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,);
                                }
                                Navigator.pop(context);

                              } ) ,
                        ],
                      ),
                    ),
                  ),
                  fallback:  (context) => Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      } ,
    );
  }
  Widget userData(BuildContext context){
    return Column(children: [
      defaultField
        (controller: nameController,
          validate: (String value){
            if(value.isEmpty) {
              return 'name must not be empty ';
            }
            return null ;
          },
          label: 'Name',
          suffix: Icons.person,
          keyboard: TextInputType.text
      ),

      SizedBox(height: 20.0,),


      defaultField
        (controller: emailController,
        validate: (String value){
          if(value.isEmpty) {
            return 'email must not be empty ';
          }
          return null ;
        },
        label: 'Email',
        suffix: Icons.email_outlined,
        keyboard: TextInputType.emailAddress,
      ),
      SizedBox(height: 20.0,),

      defaultField
        (controller: phoneController,
        validate: (String value){
          if(value.isEmpty) {
            return 'phone must not be empty ';
          }
          return null ;
        },
        label: 'Phone',
        suffix: Icons.phone,
        keyboard: TextInputType.phone,
      ),

      SizedBox(height: 200.0,),

    ],);
  }
}
