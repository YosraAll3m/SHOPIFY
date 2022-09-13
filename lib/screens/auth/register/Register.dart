import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/network/cache_helper.dart';
import 'package:shopfiy_app/screens/auth/register/cubit/cubit.dart';
import 'package:shopfiy_app/screens/auth/register/cubit/state.dart';
import 'package:shopfiy_app/styles/components/constans.dart';
import '../../../styles/components/components.dart';
import '../../mainScreen/mainScreen/main_screen_view.dart';
import '../login/login.dart';

class SignUpView extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SignUpViewCubit(),
      child: BlocConsumer<SignUpViewCubit, SignUpViewStates>(
        listener: (context, state) {
          if (state is StateSuccessRegister) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                token = state.loginModel.data.token;
                navigateFinish(
                  context,
                  MainScreenView(),
                );
              });
            } else {
              print(state.loginModel.message);

              // showToast(
              //   text: state.loginModel.message,
              //   state: ToastStates.ERROR,
              //
              // );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
                child:  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children:const [
                            Image(image: AssetImage("assets/signin_wave.png"),),
                            Positioned(top: 200,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0,top: 20),
                                child: Text("Sign Up",
                                  style:
                                  TextStyle(color: Color(0xffF94A7E),
                                      fontSize: 30,fontWeight: FontWeight.w500),


                                ),
                              ),
                            ),



                          ],


                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            allUserField(context),


                            ConditionalBuilder(
                              condition: true,
                              builder: (context) => defaultButton(
                                text: 'Sign Up',
                                onTaped: () {
                                  if (formKey.currentState.validate()) {
                                    SignUpViewCubit.get(context).userRegister(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                    );
                                  }
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                              SizedBox(height: 100,),

                              Row(
                                children: [
                                  SizedBox(width: 30,),
                                  const  Text("Already have an account ?",
                                      style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.bold
                                      ,color: Color(0xff216188))),
                                  InkWell(onTap: (){
                                    navigateFinish(context, ShopLogin());
                                  },
                                    child:const Text("Login",style: TextStyle(fontSize: 18,
                                        fontWeight: FontWeight.w500
                                        ,color: Color(0xffF94A7E))),
                                  ),

                                ],
                              ),


                            ],),
                        ),


                      ],
                    ),
                  ),

              ),

          );
        },
      ),
    );
  }
  Widget allUserField(BuildContext context){
    return Column(
      children: [

        defaultField(
          controller: nameController,
          validate: (String value) {
            if (value.isEmpty) {
              return 'name must not be empty';
            }
          },
          label: ' Name',
          suffix: Icons.person,
          keyboard: TextInputType.name,
        ),
        SizedBox(
          height: 15.0,
        ),
        defaultField(
          controller: phoneController,
          validate: (String value) {
            if (value.isEmpty) {
              return 'Phone must not be empty';
            }
          },
          label: 'Phone',
          suffix: Icons.phone,
          keyboard: TextInputType.phone,
        ),
        SizedBox(
          height: 15.0,
        ),
        defaultField(
          controller: emailcontroller,
          validate: (String value) {
            if (value.isEmpty) {
              return 'email must not be empty';
            }
          },
          label: 'Email ',
          suffix: Icons.email,
          keyboard: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 15.0,
        ),
        defaultField(
            controller: passwordcontroller,
            onSubmitted: (value) {
              if (formKey.currentState.validate()) {
                SignUpViewCubit.get(context).userRegister(
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                );
              }
            },
            validate: (String value) {
              if (value.isEmpty) {
                return 'password must not be empty';
              }
            },
            label: 'Password',
            isPassword: SignUpViewCubit.get(context).isPassword,
            prefix: Icons.lock_outline,
            keyboard: TextInputType.visiblePassword,
            suffix: SignUpViewCubit.get(context).suffix,
            onpressed: () {
              SignUpViewCubit.get(context)
                  .changePasswordVisibility();
            }),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
