import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/response/favorite_change_response.dart';
import 'package:shopfiy_app/screens/mainScreen/mainScreen/cubit/states.dart';

import '../../../../network/dio_helper.dart';
import '../../../../network/end_point.dart';
import '../../../../response/categories_response.dart';
import '../../../../response/favorites_response.dart';
import '../../../../response/home_response.dart';
import '../../../../response/login_response.dart';
import '../../../../response/product_details_response.dart';
import '../../../../styles/components/components.dart';
import '../../../../styles/components/constans.dart';
import '../../../categories/categories.dart';
import '../../../favourits/favourites.dart';
import '../../../products/products.dart';
import '../../../settings/settings.dart';


class ShopifyHomeCubit extends Cubit<ShopifyHomeStates>{
  ShopifyHomeCubit() : super(ShopifyInitialState());
  static ShopifyHomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens=[
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),

  ];

void changeBottomScreen (int index){
  currentIndex = index ;
  emit(ShopifyBottomBarState());
}

  ChangeFavoriteResponse changeFavoriteModel;

void changeFavorites(int productId)
  {
  favorites[productId] = ! favorites[productId];
  emit(ShopifyChangeFavoritesState());
  DioHelper.postData(
      url: FAVORITES,
      data: { 'product_id': productId , },
    token: token,
  ).then((value){
    changeFavoriteModel = ChangeFavoriteResponse.fromJson(value.data);
    print(value.data);
    if(! changeFavoriteModel.status) {
      favorites[productId] = ! favorites[productId];
    } else {
      getFavorites();
    }
    emit(ShopifySuccessFavoritesState(changeFavoriteModel));
  }).catchError((error){
    favorites[productId] = ! favorites[productId];
    print(error.toString());
    emit(ShopifyFavoriteErrorState(error));
  });
}

   HomeResponse homeModel;
  ProductDetailsResponse productModel;


  Map<int,bool> favorites = {} ;

 void getHomeData (){
  emit(ShopifyLoadingState());
  DioHelper.getData(
      url: HOME ,
     token: token,
  ).then((value){
    homeModel = HomeResponse.fromJson(value.data);


    homeModel.data.products.forEach((element) {
      favorites.addAll({
        element.id : element.in_favorites,
      });
    });

    emit(ShopifySuccessState());
  }).catchError((error){
    print(error.toString());
    emit(ShopifyErrorState(error.toString()));
  });

}


  void getProductDetailsData (){

    DioHelper.getData(
      url: PRODUCTDETAILS ,
      token: token,
    ).then((value){
      productModel = ProductDetailsResponse.fromJson(value.data);

      emit(ShopifySuccessProductsState());
    }).catchError((error){
      print(error.toString());
      emit(ShopifyErrorProductsState(error.toString()));
    });

  }
  CategoriesResponse categoriesModel;

  void getCategoriesData (){

    DioHelper.getData(
      url: GET_CATEGORIES ,
      token: token,
    ).then((value){
      categoriesModel = CategoriesResponse.fromJson(value.data);

      emit(ShopifySuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopifyErrorCategoriesState(error.toString()));
    });

  }

  FavoritesResponse favoritesModel;
  void getFavorites (){
   emit(ShopifyGetFavoritesLoadingState());
    DioHelper.getData(
      url: FAVORITES ,
      token: token,
    ).then((value){
      favoritesModel = FavoritesResponse.fromJson(value.data);
      printLongString(value.data.toString());
      emit(ShopifyGetFavoritesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopifyGetFavouritesErrorState(error.toString()));
    });

  }

  LoginResponse userModel;

  void getUserData (){
    emit(ShopifyGetUserDataLoadingState());
    DioHelper.getData(
      url: PROFILE ,
      token: token,
    ).then((value){
      userModel = LoginResponse.fromJson(value.data);
      emit(ShopifyGetUserDataSuccessState(userModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopifyGetUserDataErrorState(error.toString()));
    });

  }

  void UpdateUserData ({
  @required String name,
  @required String email,
  @required String phone,
  @required String image,
    @required String password,


  }){
    emit(ShopifyUpdateUserDataLoadingState());
    DioHelper.putData(
      url: UPDATE_PROFILE ,
      token: token,
      data : {
        'name' : name,
        'email' : email,
        'password' : password,
        'phone' : phone,
        'image' : image,

      },
    ).then((value){
      userModel = LoginResponse.fromJson(value.data);
      print(userModel.data.name);
      emit(ShopifyUpdateUserDataSuccessState(userModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopifyUpdateUserDataErrorState(error.toString()));
    });

  }
}