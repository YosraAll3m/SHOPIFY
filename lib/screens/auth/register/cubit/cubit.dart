import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/screens/auth/register/cubit/state.dart';

import '../../../../network/dio_helper.dart';
import '../../../../network/end_point.dart';
import '../../../../response/login_response.dart';



class SignUpViewCubit extends Cubit<SignUpViewStates>{
  SignUpViewCubit() : super(StateInitialRegister());

static SignUpViewCubit get(context) => BlocProvider.of(context);
  LoginResponse loginModel ;
void userRegister ({
  @required String name,
  @required String phone,
  @required String email,
  @required String password,
}){
  emit(StateLoadingRegister());
 DioHelper.postData(url: REGISTER,
    data: {
      'name': name,
      'phone': phone,
     'email': email,
     'password': password,
    },).then((value) {
      print(value.data);

      loginModel =  LoginResponse.fromJson(value.data);

      emit(StateSuccessRegister(loginModel));
} ).catchError((error){
  print ('errorrrrrrr here');
  print (error.toString());
  emit(StateErrorRegister( error.toString()));
} );
}
   IconData suffix = Icons.visibility_outlined;
bool isPassword = true;
  void changePasswordVisibility (){

    isPassword = ! isPassword;
    suffix = isPassword ?   Icons.visibility_outlined : Icons.visibility_off_outlined;
 emit(StatePasswordVisibilityRegister());
  }
}