


import '../../../../response/favorite_change_response.dart';
import '../../../../response/login_response.dart';

abstract class ShopifyHomeStates {}
class ShopifyInitialState extends ShopifyHomeStates {}
class ShopifyBottomBarState extends ShopifyHomeStates {}

class ShopifyLoadingState extends ShopifyHomeStates {}
class ShopifySuccessState extends ShopifyHomeStates {}
class ShopifyErrorState extends ShopifyHomeStates {
  final String error ;

  ShopifyErrorState(this.error);
}

class ShopifySuccessProductsState extends ShopifyHomeStates {}
class ShopifyErrorProductsState extends ShopifyHomeStates {
  final String error ;

  ShopifyErrorProductsState(this.error);

}
class ShopifySuccessCategoriesState extends ShopifyHomeStates {}
class ShopifyErrorCategoriesState extends ShopifyHomeStates {
  final String error ;

  ShopifyErrorCategoriesState(this.error);

}



class ShopifySuccessFavoritesState extends ShopifyHomeStates {
  final ChangeFavoriteResponse changeFavoriteResponse ;

  ShopifySuccessFavoritesState(this.changeFavoriteResponse);
}
class ShopifyChangeFavoritesState extends ShopifyHomeStates {}
class ShopifyFavoriteErrorState extends ShopifyHomeStates {
  final String error ;
  ShopifyFavoriteErrorState(this.error);

}

class ShopifyGetFavoritesLoadingState extends ShopifyHomeStates {}
class ShopifyGetFavoritesSuccessState extends ShopifyHomeStates {}
class ShopifyGetFavouritesErrorState extends ShopifyHomeStates {
  final String error ;

  ShopifyGetFavouritesErrorState(this.error);
}

class ShopifyGetUserDataLoadingState extends ShopifyHomeStates {}

class ShopifyGetUserDataSuccessState extends ShopifyHomeStates {
  final LoginResponse loginResponse ;

  ShopifyGetUserDataSuccessState(this.loginResponse);
}
class ShopifyGetUserDataErrorState extends ShopifyHomeStates {
  final String error ;

  ShopifyGetUserDataErrorState(this.error);}

class ShopifyUpdateUserDataLoadingState extends ShopifyHomeStates {}

class ShopifyUpdateUserDataSuccessState extends ShopifyHomeStates {
  final LoginResponse loginResponse ;

  ShopifyUpdateUserDataSuccessState(this.loginResponse);
}
class ShopifyUpdateUserDataErrorState extends ShopifyHomeStates {
  final String error ;

  ShopifyUpdateUserDataErrorState(this.error);}