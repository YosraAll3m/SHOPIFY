class ChangeFavoriteResponse{
  bool status;
  String message;
  ChangeFavoriteResponse.fromJson(Map <String , dynamic> json )
  {
    status = json['status'];
    message = json['message'];
  }
}