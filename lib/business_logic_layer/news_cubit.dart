import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data_layer/web_services/news_web_services.dart';
import 'package:news_app/presentation_layer/screens/business_Screen.dart';
import 'package:news_app/presentation_layer/screens/scince_screen.dart';
import 'package:news_app/presentation_layer/screens/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());


  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',

    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'Sports',

    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Scince',

    ),

  ];


  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScinceScreen(),

  ];


  void changeBottomNav(int index){
    currentIndex = index;
    if(index == 1)
      getSports();
    emit(NewsBottomNavState());

  }


  List<dynamic> business = [];

  void getBusiness(){

    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines' , query:
    {
      'country':'us',
      'category':'business',
      'apiKey':'11c144d4659c4cd78d372709c2c63286'

    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']['urlToImage']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

}



  List<dynamic> sports = [];

  void getSports(){

    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines' , query:
    {
      'country':'us',
      'category':'sports',
      'apiKey':'11c144d4659c4cd78d372709c2c63286'

    }).then((value) {
      sports = value.data['sports'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });

  }



  List<dynamic> science = [];

  void getScience(){

    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines' , query:
    {
      'country':'us',
      'category':'science',
      'apiKey':'11c144d4659c4cd78d372709c2c63286'

    }).then((value) {
      science = value.data['science'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });

  }

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode (){
    isDark = !isDark;
    emit(NewsChangeAppModeState());

  }



}
