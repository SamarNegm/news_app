import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/local/cachHelper.dart';
import 'package:news_app/Logic/App/App%20State.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InisialState());
  static AppCubit get(context) => BlocProvider.of(context);
  static bool dark = cacheHelper.getData();
  bool isDark() {
    return dark;
  }

  void changeAppMode() {
    dark = !dark;
    cacheHelper.putData(dark).then((value) => emit(changeAppModeState()));
  }
}
