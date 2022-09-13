import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/widgets/social_button.dart';
import '../../../network/cache_helper.dart';
import '../../../styles/components/components.dart';
import '../../../styles/components/constans.dart';
import '../../mainScreen/mainScreen/main_screen_view.dart';
import '../register/Register.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class ShopLogin extends StatelessWidget {

var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,StatesLogin>(
     listener:  (context , state) {
       if(state is StateSuccessLogin)
       {
         if (state.loginModel.status)
         {

          print(state.loginModel.message);
           print(state.loginModel.data.token);
        CacheHelper.saveData(key: 'token',
            value: state.loginModel.data.token ).
        then((value){
          token = state.loginModel.data.token;
          navigateFinish(context, MainScreenView(),);
        } );

         } else
         {
          print (state.loginModel.message);

          // showToast(
          //   text: state.loginModel.message,
          //   state: ToastStates.ERROR,
          //
          // );
         }
       }
     },
        builder: (context , state ) {
       return  Scaffold(
           backgroundColor: Colors.white,
         body: SingleChildScrollView(
               child: Form(
                 key : formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Stack(
                  children:const [
                    Image(image: AssetImage("assets/signin_wave.png"),),
                    Positioned(top: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0,top: 20),
                        child: Text("Welcome\n Back",
                           style:
                           TextStyle(color: Color(0xffF94A7E),
                            fontSize: 30,fontWeight: FontWeight.w500),


                        ),
                      ),
                    ),



                  ],


                ),
                   Padding(padding: EdgeInsets.all(20),
                   child: Column(
                     children: [
                       emailAndPasswordTextField(context),
                       ConditionalBuilder(
                         condition: state is! StateLoadingLogin ,

                         builder: (context) =>  defaultButton(text: 'LOGIN',

                           onTaped: (){
                             if (formKey.currentState.validate()){
                               LoginCubit.get(context).userLogin(email: emailcontroller.text,
                                   password: passwordcontroller.text);

                             }

                           }
                           ,
                           isUpperCase: true,

                         ),
                         fallback: (context) => Center(child: CircularProgressIndicator(color: Color(0xff216188),)),
                       ),

                       socialLogin(context),
                       Row(
                         children: [
                           SizedBox(width: 30,),

                           const  Text("Don't have an account ?",style: TextStyle(fontSize: 18,
                               fontWeight: FontWeight.bold
                               ,color: Color(0xff216188))),
                           InkWell(onTap: (){
                             navigateFinish(context, SignUpView());
                           },
                             child:const Text("Sign UP ",style: TextStyle(fontSize: 18,
                                 fontWeight: FontWeight.w500
                                 ,color: Color(0xffF94A7E))),
                           ),

                         ],
                       ),
                     ],
                   ),

                   )
                   ],
                 ),
               ),


         ),
       );
        },
      ),
    );
  }

Widget emailAndPasswordTextField(BuildContext context){
    return Column(
      children: [
        SizedBox(height: 30.0,),
        defaultField(controller: emailcontroller,
          validate: (String value){
            if (value.isEmpty){
              return 'email must not be empty';
            }
          },
          label: 'Email ',
          suffix: Icons.email,
          keyboard: TextInputType.emailAddress,),
        SizedBox(height: 15.0,),

        defaultField(controller: passwordcontroller,
            onSubmitted: (value){
              if (formKey.currentState.validate()){
                LoginCubit.get(context).userLogin(
                    email: emailcontroller.text,
                    password: passwordcontroller.text); }
            },
            validate: (String value){
              if (value.isEmpty){
                return 'password must not be empty';
              }
            },
            label: 'Password',
            isPassword :   LoginCubit.get(context).isPassword,
            keyboard: TextInputType.visiblePassword,
            suffix:   LoginCubit.get(context).suffix,
            onpressed: (){
              LoginCubit.get(context).changePasswordVisibility();

            }

        ),
        SizedBox(height: 20.0,),
      ],
    );

}
Widget socialLogin(BuildContext context){
  return Column(children: [
    const  SizedBox(height: 40,),

    Row(children: const [
      Expanded(
        child: Divider(color: Color(0xff216188),thickness: 1.5,
        ),
      ),                  SizedBox(width: 15,),

      SizedBox(width: 35,
        child: Text("OR",style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.w400
            ,color: Color(0xff216188))),
      ),
      Expanded(child: Divider(color: Color(0xff216188),thickness: 1.5)),
    ],),
    const   SizedBox(height: 20,),
    Row(
      children: const [
        SizedBox(width: 120,),

        SocialButton(image: "assets/google.png",),
        SizedBox(width: 15,),

        SocialButton(image: "assets/facebook.png",),
        SizedBox(width: 15,),

        SocialButton(image: "assets/instagram.png",),
      ],
    ),
    const  SizedBox(height: 120,),
  ],);
}
}
