import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Logic/Home/HomeCubit.dart';
import 'package:news_app/Logic/Home/HomeState.dart';

class Home extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAppCubit()
        ..getBusiness()
        ..getScience()
        ..getSports(),
      child: BlocConsumer<HomeAppCubit, HomeAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeAppCubit.get(context);
          print(cubit.selectedPageIndex);
          return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ));
        },
      ),
    );
  }
}
