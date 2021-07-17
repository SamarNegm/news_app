import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/Remote/DioHelper.dart';
import 'package:news_app/Logic/Home/HomeState.dart';
import 'package:news_app/layouts/Screens/Business/Business.dart';
import 'package:news_app/layouts/Screens/Science/Science.dart';
import 'package:news_app/layouts/Screens/Settings/settings.dart';
import 'package:news_app/layouts/Screens/Sports/Sports.dart';

class HomeAppCubit extends Cubit<HomeAppState> {
  HomeAppCubit() : super(InisialState());
  static HomeAppCubit get(context) => BlocProvider.of(context);
  List pages = [Sports(), Science(), Business(), Settings()];
  bool addIcon = true;
  int selectedPageIndex = 0;

  int changeButtomNavigationBar(int index) {
    selectedPageIndex = index;
    emit(ChngeAppBar());
    return selectedPageIndex;
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '82f654e889b44c728c75b6694881c43d',
      },
    ).then((value) {
      print('hi3 ' + value.toString());
      print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '82f654e889b44c728c75b6694881c43d',
      },
    ).then((value) {
      print('hi3 ' + value.toString());
      print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '82f654e889b44c728c75b6694881c43d',
      },
    ).then((value) {
      print('hi3 ' + value.toString());
      print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
}
