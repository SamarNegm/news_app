import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Logic/Home/HomeCubit.dart';
import 'package:news_app/Logic/Home/HomeState.dart';
import 'package:news_app/layouts/Widgets/CommonWidgets.dart';

class Sports extends StatelessWidget {
  const Sports({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeAppCubit, HomeAppState>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var list = HomeAppCubit.get(context).sports;
        return articleBuilder(list, context);
      },
    );
  }
}
