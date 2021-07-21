import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/local/cachHelper.dart';
import 'package:news_app/Logic/App/AppCubit.dart';
import 'package:news_app/Logic/Home/HomeCubit.dart';
import 'package:news_app/Logic/Home/HomeState.dart';
import 'package:news_app/layouts/Screens/search/search.dart';

class Home extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeAppCubit, HomeAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeAppCubit.get(context);
          print(cubit.selectedPageIndex);
          return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SearchScreen.routName);
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeAppMode();
                      },
                      icon: Icon(Icons.brightness_4_outlined))
                ],
              ),
              body: cubit.pages[cubit.selectedPageIndex],
              key: scaffoldKey,
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeButtomNavigationBar(index);
                },
                currentIndex: cubit.selectedPageIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: 'Sports',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science), label: 'Science'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business), label: 'Business'),
                ],
              ));
        },

    );
  }
}
