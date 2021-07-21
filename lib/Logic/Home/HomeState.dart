abstract class HomeAppState {}

class InisialState extends HomeAppState {}

class ChngeAppBar extends HomeAppState {}

class NewsGetLoadingState extends HomeAppState {}

class NewsGetSuccessState extends HomeAppState {}

class NewsGetErrorState extends HomeAppState {
  final error;

  NewsGetErrorState(this.error);
}
