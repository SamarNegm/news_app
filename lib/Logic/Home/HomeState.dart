abstract class HomeAppState {}

class InisialState extends HomeAppState {}

class ChngeAppBar extends HomeAppState {}

class NewsGetLoadingState extends HomeAppState {}

class NewsGetBusinessSuccessState extends HomeAppState {}

class NewsGetBusinessErrorState extends HomeAppState {
  final error;

  NewsGetBusinessErrorState(this.error);
}
