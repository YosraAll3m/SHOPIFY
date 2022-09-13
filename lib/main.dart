import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/network/dio_helper.dart';
import 'package:shopfiy_app/screens/auth/login/login.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/cubit.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/main_screen_view.dart';
import 'package:shopfiy_app/shared/bloc_observer.dart';
import 'package:shopfiy_app/splash/spalsh_view.dart';
import 'package:shopfiy_app/styles/components/constans.dart';
import 'network/cache_helper.dart';

void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init();
  await CacheHelper.init();
  Bloc.observer= MyBlocObserver();
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);
  print(onBoarding);
  if (onBoarding != null ) {
    if (token != null ) {
      widget = MainScreenView();
    }else  widget = ShopLogin();
  } else {
    widget = Splash();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget}) ;



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ShopifyHomeCubit()..
        getHomeData()..getCategoriesData()..getFavorites()..getUserData() ),
      ],
      child :
      MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: startWidget,
      ), );
  }
}

