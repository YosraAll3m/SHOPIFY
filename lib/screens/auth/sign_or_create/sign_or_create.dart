import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopfiy_app/screens/auth/login/login.dart';
import '../../../../widgets/default_button.dart';


class SignOrCreate extends StatelessWidget{
  const SignOrCreate({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 150,),
            Center(
              child: Lottie.asset("assets/sign_or_create.json",animate: true,repeat: false,
              ),



            ),
            Spacer() ,
            DefaultButton(title: "Login",color: Color(0xffF94A7E),
                onTaped:(){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopLogin()));
                }
            ),
            SizedBox(height: 20,),
            DefaultButton(title: "Create Account",color: Color(0xff216188),
                onTaped:(){
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpView()));
                }
            ),


          ],
        ),
      ),
    );
  }
}