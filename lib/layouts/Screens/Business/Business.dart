import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Logic/Home/HomeCubit.dart';
import 'package:news_app/Logic/Home/HomeState.dart';
import 'package:news_app/layouts/Widgets/CommonWidgets.dart';

class Business extends StatelessWidget {
  const Business({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeAppCubit, HomeAppState>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var list = HomeAppCubit.get(context).business;
        return list.length > 0
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleItem(list[index], ctx),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: list.length,
              )
            : Container(
                child: Center(
                child: Text('empty'),
              ));
      },
    );
  }
}
