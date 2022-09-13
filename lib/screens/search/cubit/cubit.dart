import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfiy_app/response/search_response.dart';
import 'package:shopfiy_app/screens/search/cubit/state.dart';
import 'package:shopfiy_app/styles/components/constans.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_point.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchResponse model ;

  void getSearch (String text) {
    emit(SearchLoadingState());
    DioHelper.postData(url: SEARCH,
        token: token,
        data: {
      text : 'text',
        },
    ).then((value) {
      model = SearchResponse.fromJson(value.data);
      emit (SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}