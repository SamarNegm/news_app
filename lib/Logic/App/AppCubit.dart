import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Logic/App/App%20State.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InisialState());
  static AppCubit get(context) => BlocProvider.of(context);
  static bool dark = false;
  bool isDark() {
    return dark;
  }

  void changeAppMode() {
    dark = !dark;
    emit(changeAppModeState());
  }
}
