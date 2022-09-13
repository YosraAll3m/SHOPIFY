import 'package:flutter/material.dart';

import '../../network/cache_helper.dart';
import '../../screens/auth/login/login.dart';
import 'components.dart';

void signOut (context){

   CacheHelper.removeData(key: 'token',).then((value) {
   if(value ){
   navigateFinish(context, ShopLogin());
} });
}
    String token = '';